
<template>
    <div>
        <el-button @click="change(1)">店铺信息</el-button>
        <el-button @click="change(2)">经销商信息</el-button>
        <el-button @click="logout()">注销登录</el-button>
        <el-row>
            <el-col :span="24">
                <el-table size="mini" :data="master_user.data" border style="width: 100%" highlight-current-row v-loading="loading">
                    
                    <el-table-column v-for="v in is_store?master_user.columns_store:master_user.columns_dist" :key="v.field" :prop="v.field" :label="v.title" :width="v.width">
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
                            <span v-if="!scope.row.isSet" class="el-tag el-tag--mini" style="cursor: pointer;" @click="getGoodsInStore(scope.row['store_id'])">
                                商品
                            </span>
                            <span class="el-tag el-tag--info el-tag--mini" style="cursor: pointer;" @click="pwdChange(scope.row,scope.$index,true)">
                                {{scope.row.isSet?"保存":"修改"}}
                            </span>
                            <span v-if="!scope.row.isSet" class="el-tag el-tag--danger el-tag--mini" style="cursor: pointer;" @click="deleteMasterUser(scope.$index)">
                                删除
                            </span>
                            <span v-else class="el-tag  el-tag--mini" style="cursor: pointer;" @click="pwdChange(scope.row,scope.$index,false)">
                                取消
                            </span>
                        </template>
                    </el-table-column>
                </el-table>
            </el-col>
            <el-col :span="24" hidden=true>
                <div class="el-table-add-row" style="width: 99.2%;" @click="addMasterUser()"><span>+ 添加</span></div>
            </el-col>
            <el-col :span="24">
                <div class="el-table-add-row" style="width: 99.2%;" @click="readMasterUser()"><span>刷新</span></div>
            </el-col>
        </el-row>
    </div>
</template>

<script>
import axios from 'axios'

//axios.defaults.baseURL="http://localhost:8081"
axios.defaults.baseURL = 'http://47.103.15.32:8081'

var generateId = {
        _count: 1,
        get(){return ((+new Date()) + "_" + (this._count++))}
};

export default {
    //主要内容
    name: 'adminForm',
    data() {
        return {
            master_user: {
                sel: null,//选中行
                columns_store: [
                    { field: "store_id", title: "店铺ID", width: 120 },
                    { field: "name", title: "店铺名称", width: 120 },
                    { field: "address", title: "店铺地址"},
                    { field: "starttime", title: "营业开始时间", width: 220 },
                    { field: "endtime", title: "营业结束时间", width: 220 },
                    { field: "store_phone_nu", title: "店铺手机号",width: 120 }
                ],
                columns_dist: [
                    { field: "store_id", title: "店铺ID", width: 120 },
                    { field: "location", title: "地理位置" },
                    { field: "truename", title: "真实姓名", width: 120 },
                    { field: "dist_phone_nu", title: "经销商联系方式", width: 120 },
                    { field: "password", title: "密码", width: 120 }
                ],
                data: [],
            },
            loading: false,
            is_store: true
        }
    },
    created () {
        this.readMasterUser()
    },
    methods: {
        logout() {
            let axiosConfig = {
            headers: {
                'Content-Type': 'application/json;charset=UTF-8',
                'Access-Control-Allow-Origin': "*"
            },
            withCredentials: true,
            }
            axios.post('/logout',{} ,axiosConfig).then((res)=>{
                console.log(res.data)
                // document.cookie = "adminName="
                // document.cookie = "adminPassword="
                this.$router.replace({path:'/'})
            })

        },
        change(num) {
            if (num==1) {
                this.is_store = true
            }else{
                this.is_store = false
            }
        },
        //读取表格数据
        readMasterUser() {
            this.loading = true

            axios.get('/admin/getstore', {
                headers: {
                    'Content-Type': 'application/json;charset=UTF-8',
                    'Access-Control-Allow-Origin': "*"
                },
                withCredentials: true
            }).then((res)=>{
                console.log(res)
                this.master_user.data = res.data
            })

            this.master_user.data.map(i => {
                i.id = generateId.get();//模拟后台插入成功后有了id
                i.isSet=false;//给后台返回数据添加`isSet`标识
                i._temporary = true
                return i;
            })

            this.loading = false
        },
        //添加账号
        addMasterUser() {
            for (let i of this.master_user.data) {
                if (i.isSet) return this.$message.warning("请先保存当前编辑项");
            }
            let j = { id: 0, "store_id": "", "name": "", "address": "",
                     "starttime": "", "endtime": "", "store_image_id": "",
                     "location": "", "truename": "", "dist_phone_nu": "",
                     "password":"", "dist_image_id": "", "store_phone_nu": "",
                     "isSet": true, "_temporary": true };
            this.master_user.data.push(j);
            this.master_user.sel = JSON.parse(JSON.stringify(j))
        },
        //删除
        deleteMasterUser(index) {
            //点击修改 判断是否已经保存所有操作
            for (let i of this.master_user.data) {
                if (i.isSet) {
                    this.$message.warning("请先保存当前编辑项");
                    return false;
                }
            }
            console.log(index)
            this.$message.warning("尚未开启删除功能");
            return false;

            //this.master_user.data.splice(index, 1);
            //this.master_user.sel = null;
        },
        getGoodsInStore(index) {
            this.GLOBAL.store_id = index
            this.$router.push('/goods')
        },
        //修改
        pwdChange(row, index, cg) {
            //点击修改 判断是否已经保存所有操作
            for (let i of this.master_user.data) {
                if (i.isSet && i.id != row.id) {
                    this.$message.warning("请先保存当前编辑项");
                    return false;
                }
            }
            //是否是取消操作
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
                this.loading = true
                let axiosConfig = {
                    headers: {
                        'Content-Type': 'application/json;charset=UTF-8',
                        'Access-Control-Allow-Origin': "*"
                    },
                    withCredentials: true
                }
                if (this.is_store) {
                    let params = {
                        store_id: row.store_id,
                        name: row.name,
                        address: row.address,
                        starttime: row.starttime,
                        endtime: row.endtime,
                        store_phone_nu: row.store_phone_nu
                    }
                    axios.post('/admin/modifystore', params , axiosConfig). then((res)=>{
                        if (res.data.status=="ok") {
                            this.loading = false
                            alert("修改店铺信息成功！")
                        }else{
                            this.loading = false
                            alert("修改失败") 
                        }
                    })
                }else{
                    let params = {
                        store_id: row.store_id,
                        location: row.location,
                        truename: row.truename,
                        dist_phone_nu: row.dist_phone_nu,
                        password: row.password
                    }
                    axios.post('/admin/modifydist', params, axiosConfig).then((res)=>{
                        if (res.data.status == "ok") {
                            this.loading = false
                            alert("修改经销商信息成功！")
                        }else{
                            this.loading = false
                            alert("修改失败")
                        }
                    })
                }
                //this.readMasterUser()

                //然后这边重新读取表格数据
                row.isSet = false;
                this.master_user.data.splice(index, 1, row)
            } else {
                this.master_user.sel = JSON.parse(JSON.stringify(row));
                row.isSet = true;
                this.master_user.data.splice(index, 1, row)
            }
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
</style>

