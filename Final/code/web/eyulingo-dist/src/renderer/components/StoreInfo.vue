<template>
    <div>
        <el-upload
            class="avatar-uploader"
            action="http://47.103.15.32:8080/img/upload"
            :multiple="false"
            :with-credentials="true"
            :show-file-list="false"
            :on-success="handleAvatarSuccess"
            :before-upload="beforeAvatarUpload"> 
            <img v-if="imageUrl" class="avatar" :src="imageUrl" :style="styleMode">
            <img v-else src="https://cube.elemecdn.com/9/c2/f0ee8a3c7c9638a54940382568c9dpng.png" class="avatar">
        </el-upload>
        <!-- ========================== -->
        <el-row>
            <el-col :span="24">
                <el-table size="mini" :data="master_user.data" border style="width: 100%" highlight-current-row v-loading="loading">

                    <el-table-column v-for="v in master_user.columns_store" :key="v.filed" :prop="v.field" :label="v.title" :width="v.width">
                        <template slot-scope="scope">
                            <span v-if="v.field=='store_id'">{{scope.row[v.field]}}</span>
                            <span v-else-if="scope.row.isSet">
                                <el-input size="mini" placeholder="请输入内容" v-model="master_user.sel[v.field]">
                                </el-input>
                            </span>
                            <span v-else>{{scope.row[v.field]}}</span>
                        </template>
                    </el-table-column>
                    <el-table-column label="操作" width="100">
                        <template slot-scope="scope">
                            <span class="el-tag el-tag--info el-tag--mini" style="cursor: pointer;" @click="pwdChange(scope,scope.row,scope.$index,true)">
                                {{scope.row.isSet?"保存":"修改"}}
                            </span>
                            <span v-if="scope.row.isSet" class="el-tag  el-tag--mini" style="cursor: pointer;" @click="pwdChange(scope,scope.row,scope.$index,false)">
                                取消
                            </span>
                        </template>
                    </el-table-column>
                </el-table>
            </el-col>
        </el-row>
        <!-- ========================== -->
        <el-card class="box-card">
            <div slot="header" class="clearfix">
                <span>默认配送方式</span>
                <el-button style="float: right; padding: 3px 0" type="text" @click="deliveChange(true)">{{!isChanging?"修改":"保存"}}</el-button>
                <el-button v-if="isChanging" style="float: right; padding: 3px 0; color:red; margin-left: 3px" type="text" @click="deliveChange(false)">取消</el-button>
            </div>
            <div v-if="!isChanging" class="text item">
                {{master_user.data[0].delivery_method}}
            </div>
            <el-select v-else v-model="master_user.data[0].delivery_method" placeholder="请选择">
                <el-option
                    v-for="item in deliver_options"
                    :key="item.delivery_method"
                    :label="item.delivery_method"
                    :value="item.delivery_method">
                </el-option>
            </el-select>
        </el-card>
        <!-- ========================== -->
        <el-divider></el-divider>
        <el-card class="box-card">
            <div slot="header" class="clearfix">
                <span>顾客评论</span>
            </div>
            <div style="display: block">
                <el-card class="comment" v-for="comment in master_user.data[0].comments">
                    <div slot="header" class="clearfix">
                        <span>{{comment.username}} 的评价</span>
                        <el-rate
                                :value="comment.star_count"
                                disabled
                                show-score
                                text-color="#ff9900"
                                score-template="{value}">
                        </el-rate>
                    </div>
                    <span style="word-break: break-all; word-wrap: break-word">
                            {{comment.comment_content}}
                        </span>
                </el-card>

            </div>
        </el-card>
        <div class="el-table-add-row" style="width: 99.2%;" @click="readMasterUser()"><span>刷新</span></div>
    </div>
    
</template>

<script>
import axios from 'axios'
//axios.defaults.baseURL="http://localhost:8080"
axios.defaults.baseURL="http://47.103.15.32:8082"
export default {
    name: 'storeInfo',
    data() {
        return {
            master_user: {
                sel: null,//选中行
                columns_store: [                    
                    { field: "name", title: "店铺名称", width: 120 },
                    { field: "address", title: "店铺地址"},
                    { field: "starttime", title: "营业开始时间", width: 220 },
                    { field: "endtime", title: "营业结束时间", width: 220 },
                    { field: "store_phone_nu", title: "店铺手机号",width: 120 }
                ],
                data: [],
            },
            deliver_options:[],
            old_delivery_method: '',
            loading: false,
            isChanging: false,
            imageUrl: "",
            styleMode: {
                height: '200px',
                width: '200px'
            }
        }
    },
    created() {
        this.readMasterUser()
    },
    methods: {
        getImg(src, vue) {
            var img = new Image()
            img.src = src
            img.onload = function () {
                vue.styleMode.height = Math.ceil(this.height/this.width * 460)+'px'
                vue.styleMode.width = '460px'
            }
        },
        readMasterUser() {
            this.loading = true
            this.imageUrl = ""
            axios.get('/store/mystoreinfo', {
                withCredentials: true
            }).then((res)=>{
                console.log(res.data)
                this.master_user.data = []
                this.master_user.data.push(res.data)
                this.imageUrl = "http://47.103.15.32:8080/img/download?fileId="+this.master_user.data[0].store_image_id
                this.getImg(this.imageUrl, this)
            })

            axios.get('/store/getalldelivery', {
                withCredentials: true
            }).then((res)=>{
                console.log(res.data)
                this.deliver_options = res.data
            })

            this.loading = false
            console.log(this.master_user.data)
        },
        //添加账号
        handleAvatarSuccess(response){
            console.log(response)
            let params = {
                image_id: response.file_id
            }
            let axiosConfig = {
                headers: {
                    'Content-Type': 'application/json;charset=UTF-8',
                    'Access-Control-Allow-Origin': "*"
                }
            }
            axios.post('/store/cover', params, axiosConfig).then((res)=>{
                if (res.data.status=="ok") {
                    this.readMasterUser()
                    this.$message.success('更新封面成功。')
                }else{
                    this.$message.error('更新封面失败。')
                }
            })
            this.$message.success('上传成功!');
        },
        beforeAvatarUpload(file) {
            const isLt2M = file.size / 1024 / 1024 < 2;

            if (!isLt2M) {
              this.$message.error('上传封面图片大小不能超过 2MB!');
            }
            return isLt2M;
        },
        //修改
        pwdChange(scope,row, index, cg) {
            //是否是取消操作
            console.log(scope)
            if (!cg) {
                if (!this.master_user.sel.id) {
                    row.isSet = !row.isSet;
                    this.master_user.data.splice(index, 1, row);
                }
                return row.isSet
            }
            //提交数据
            if (row.isSet) {
                //项目是模拟请求操作  自己修改下

                let data = JSON.parse(JSON.stringify(this.master_user.sel));
                console.log(row)
                for (let k in data) row[k] = data[k];
                console.log(row)
                console.log(data)
                let params = {
                    name: row.name,
                    address: row.address,
                    starttime: row.starttime,
                    endtime: row.endtime,
                    phone_nu: row.store_phone_nu
                }
                let axiosConfig = {
                    headers: {
                        'Content-Type': 'application/json;charset=UTF-8',
                        'Access-Control-Allow-Origin': "*"
                    },
                    withCredentials: true
                }
                axios.post('/store/modifystoreinfo', params, axiosConfig).then((res)=>{
                    if (res.data.status=="ok") {
                        this.loading = false
                        this.$message.success("修改成功！")
                    }else{
                        this.loading = false
                        this.$message.error("修改失败.")
                    }
                })
                this.readMasterUser()

                //然后这边重新读取表格数据
                row.isSet = false;
                this.master_user.data.splice(index, 1, row)
            } else {
                this.master_user.sel = JSON.parse(JSON.stringify(row));
                row.isSet = true;
                this.master_user.data.splice(index, 1, row)
            }
        },
        deliveChange(change) {
            if (!change) {
                this.isChanging = !this.isChanging

                console.log(this.master_user.data[0].delivery_method)
                let newData = this.master_user.data[0]
                newData.delivery_method = this.old_delivery_method
                this.master_user.data.splice(0, 1, newData)
                console.log(this.master_user.data[0].delivery_method)

                return this.isChanging
            }

            if (this.isChanging) {
                this.isChanging = !this.isChanging
                //console.log(this.master_user.data[0].delivery_method)
                //console.log("if")
                // 保存
                axios.post('/store/setdefaultdelivery', {
                    delivery: this.master_user.data[0].delivery_method
                }).then((res)=>{
                    if (res.data.status=="ok") {
                        this.$message.success("保存成功！")
                    }else{
                        this.$message.error("保存失败。")
                        this.readMasterUser()
                    }
                })
            }else{
                this.old_delivery_method = this.master_user.data[0].delivery_method
                this.isChanging = !this.isChanging
                console.log(this.master_user.data[0].delivery_method)
            }
        },
        dist_logout() {
            axios.post('/logout', {}).then((res)=>{
                if (res.data.status=="ok") {
                    this.$router.replace({
                        path:'/'
                    })
                }
            })
        }
    }
}
</script>

<style>
.el-table-add-row {
    margin-top: 10px;
    width: 100%;
    height: 34px;
    border: 1px dashed #c1c1cd;
    border-radius: 3px;
    cursor: pointer;
    justify-content: center;
    display: flex;
    line-height: 34px;
}
.avatar-uploader .el-upload {
    border: 1px dashed #d9d9d9;
    border-radius: 15px;
    cursor: pointer;
    position: relative;
}
.avatar-uploader .el-upload:hover {
  border-color: #409EFF;
}
.avatar {
  display: block;
}.text {
  font-size: 14px;
}
.item {
  margin-bottom: 18px;
}
.clearfix:before,
.clearfix:after {
  display: table;
  content: "";
}
.clearfix:after {
  clear: both
}
.box-card {
  margin-top: 10px;
  margin-bottom: 30px;
  padding-bottom: 20px;
}
.comment {
    margin: 5px;
    float: left;
    width: 300px;
}

</style>