<template>
    <div>

        <el-row>
            <el-col :span="24">
                <el-table size="mini" :data="master_user.data" border style="width: 100%" highlight-current-row v-loading="loading">
                    <el-table-column @click="getGoodsInStore(scope.$index)" v-for="v in master_user.columns_good" :key="v.filed" :prop="v.field" :label="v.title" :width="v.width">
                        <template slot-scope="scope">

                                <span v-if="v.field=='id'">
                                    {{scope.row[v.field]}}
                                </span>
                            <span v-else-if="v.field=='image_id'">
                                    <div v-if="!scope.row.isSet">
                                        <img v-if="scope.row.image_id" class="picture" :src="'http://47.103.15.32:8080/img/download?fileId='+scope.row.image_id" :style="styleModeList[scope.$index]">
                                        <img v-else src="https://cube.elemecdn.com/9/c2/f0ee8a3c7c9638a54940382568c9dpng.png" class="picture">
                                    </div>
                                    <el-upload
                                            v-else
                                            class="picture-uploader"
                                            action="http://47.103.15.32:8080/img/upload"
                                            :multiple="false"
                                            :with-credentials="true"
                                            :show-file-list="false"
                                            :on-success="(response)=>handlePictureSuccess(response, scope.$index, scope.row)"
                                            :before-upload="beforePictureUpload">
                                        <img v-if="scope.row.image_id" class="picture" :src="'http://47.103.15.32:8080/img/download?fileId='+scope.row.image_id" :style="styleModeList[scope.$index]">
                                        <img v-else src="https://cube.elemecdn.com/9/c2/f0ee8a3c7c9638a54940382568c9dpng.png" class="picture">
                                    </el-upload>
                                </span>
                            <span v-else-if="v.field=='tags' && !scope.row.isSet">
                                    <TagsBox
                                            :tags="scope.row.tags"
                                            :goodId="scope.row.id">
                                    </TagsBox>
                                </span>
                            <span v-else-if="v.field=='tags' && scope.row.isSet">
                                    <ReadOnlyTagsBox
                                            :tags="scope.row.tags"
                                            :goodId="scope.row.id">
                                    </ReadOnlyTagsBox>
                                </span>
                            <span v-else-if="!scope.row.isSet">
                                    {{scope.row[v.field]}}
                                </span>
                            <span v-else>
                                    <el-input size="mini" placeholder="请输入内容" v-model="master_user.sel[v.field]">
                                    </el-input>
                                </span>

                        </template>
                    </el-table-column>
                </el-table>
            </el-col>
            <el-col :span="24">
                <div class="el-table-add-row" style="width: 99.2%;" @click="readMasterUser()"><span>刷新</span></div>
            </el-col>
            <el-col :span="24">
                <div class="el-table-add-row" style="width: 99.2%;" @click="goBack()"><span>返回</span></div>
            </el-col>
        </el-row>
    </div>
</template>

<script>
    import TagsBox from './TagsBox.vue'
    import axios from 'axios'
    import ReadOnlyTagsBox from "./ReadOnlyTagsBox";
    //axios.defaults.baseURL="http://localhost:8080"
    axios.defaults.baseURL="http://47.103.15.32:8081"
    export default {
        name: 'goodsInfo',
        components: {
            ReadOnlyTagsBox,
            TagsBox
        },
        data() {
            return {
                master_user: {
                    sel: null,//选中行
                    columns_good: [
                        { field: "id", title: "商品ID" ,width: 80},
                        { field: "image_id", title: "图片",width: 320},
                        { field: "name", title: "商品名称", width: 100 },
                        { field: "price", title: "价格", width: 80 },
                        { field: "coupon_price", title: "优惠价格", width: 80 },
                        { field: "storage", title: "库存", width: 120 },
                        { field: "description", title: "描述",width: 220 },
                        { field: "tags", title: "标签"}
                    ],
                    data: []
                },
                loading: false,
                styleModeList: []
            }
        },
        created() {
            this.readMasterUser()
        },
        methods: {
            readMasterUser() {
                this.loading = true
                axios.get('/admin/getgoods?store_id=' + this.GLOBAL.store_id, {withCredentials: true}).then((res)=>{
                    console.log(res.data)
                    this.master_user.data = []
                    res.data.values.forEach((element)=>{
                        if (element.hidden==false) {
                            this.master_user.data.push(element)
                        }
                    })
                    this.loading = false
                    this.styleModeList = []
                    this.master_user.data.forEach((element, index, arr) => {
                        //console.log(index)
                        if (index==0) {
                            let len = arr.length
                            while(len>0) {
                                let styleMode = {}
                                this.styleModeList.push(styleMode)
                                len--
                            }
                        }
                        this.getImg('http://47.103.15.32:8080/img/download?fileId='+element.image_id, index, this)
                    })
                })
            },
            getImg(src, index, vue) {
                console.log(src)
                var img = new Image()
                img.src = src
                img.onload = function () {
                    var styleMode = {}
                    styleMode.height = Math.ceil(this.height/this.width * 300)+'px'
                    styleMode.width = '300px'
                    vue.styleModeList.splice(index, 1, styleMode)
                    console.log(vue.styleModeList)
                }
            },
            handlePictureSuccess(response, index, row) {
                if (!row.isSet) {
                    console.log(response)
                    let params = {
                        good_id: row.id,
                        name: row.name,
                        price: row.price,
                        coupon_price: row.coupon_price,
                        storage: row.storage,
                        description: row.description,
                        image_id: response.file_id,
                        hidden: row.hidden
                    }
                    let axiosConfig = {
                        headers: {
                            'Content-Type': 'application/json;charset=UTF-8',
                            'Access-Control-Allow-Origin': "*"
                        }
                    }
                    axios.post('/admin/modifygood', params, axiosConfig).then((res)=>{
                        if (res.data.status=="ok") {
                            this.readMasterUser()
                            this.$message.success('更新商品图片成功。')
                        }else{
                            this.$message.error('更新商品图片失败。');
                        }
                    })
                }else{
                    this.master_user.sel.image_id = response.file_id

                    row.image_id = response.file_id
                    row.imgChanged = true
                    this.master_user.data.splice(index, 1, row)
                    var styleMode = {}
                    this.styleModeList.push(styleMode)
                    this.getImg('http://47.103.15.32:8080/img/download?fileId='+row.image_id, index, this)
                }

                this.$message.success('上传成功！')
            },
            beforePictureUpload(file) {
                const isLt2M = file.size / 1024 / 1024 < 2;

                if (!isLt2M) {
                    this.$message.error('上传封面图片大小不能超过 2MB!');
                }
                return isLt2M;
            },
            addMasterUser() {
                for (let i of this.master_user.data) {
                    if (i.isSet) return this.$message.warning("请先保存当前编辑项")
                }
                let newGood = {
                    "id":'待添加',"tags":'',"hidden":false,"tags":[],
                    "name": '', "price":'',"coupon_price":'',"storage":'',
                    "description":'',"image_id":'',"isSet":true
                }
                this.master_user.data.push(newGood)
                this.master_user.sel = JSON.parse(JSON.stringify(newGood))
                console.log(this.master_user.data)
            },
            deleteMasterUser(index) {
                for (let i of this.master_user.data) {
                    if (i.isSet) {
                        this.$message.warning("请先保存当前编辑项");
                        return false;
                    }
                }

                this.$confirm('是否确认删除该商品?', '提示', {
                    confirmButtonText: '确定',
                    cancelButtonText: '取消',
                    type: 'warning'
                }).then(() => {
                    var good = this.master_user.data[index]

                    let params = {
                        good_id: good.id,
                        name: good.name,
                        price: good.price,
                        coupon_price: good.coupon_price,
                        storage: good.storage,
                        description: good.description,
                        image_id: good.image_id,
                        hidden: true
                    }
                    let axiosConfig = {
                        headers: {
                            'Content-Type': 'application/json;charset=UTF-8',
                            'Access-Control-Allow-Origin': "*"
                        }
                    }
                    axios.post('/admin/modifygood', params, axiosConfig).then((res)=>{
                        if (res.data.status=="ok") {
                            this.readMasterUser()
                            this.$message.success('删除商品成功。')
                        }else{
                            this.$message.error('删除商品失败。');
                        }
                    })
                    this.readMasterUser()
                }).catch(() => {
                    this.$message({
                        type: 'info',
                        message: '已取消删除'
                    })
                })


            },
            goBack() {
                this.$router.push('/admin')
            },
            pwdChange(row, index, cg) {
                for (let i of this.master_user.data) {
                    if (i.isSet && i.id != row.id) {
                        this.$message.warning("请先保存当前编辑项");
                        return false;
                    }
                }
                if(!cg) {

                    if (row.id=="待添加") {
                        this.master_user.data.splice(index, 1)
                    }else{
                        if (row.imgChanged ==true) {
                            this.readMasterUser()
                        }else{
                            row.isSet = !row.isSet
                            this.master_user.data.splice(index, 1, row)
                        }
                    }

                    return row.isSet
                }
                if (row.isSet) {
                    let data = JSON.parse(JSON.stringify(this.master_user.sel))
                    for (let k in data) row[k] = data[k]
                    this.loading = true
                    let axiosConfig = {
                        headers: {
                            'Content-Type': 'application/json;charset=UTF-8',
                            'Access-Control-Allow-Origin': "*"
                        },
                        withCredentials: true
                    }

                    if (row.id=="待添加") {
                        let params = {
                            name: row.name,
                            price: row.price,
                            coupon_price: row.coupon_price,
                            storage: row.storage,
                            description: row.description,
                            image_id: row.image_id
                        }
                        axios.post('/admin/addgood', params, axiosConfig).then((res)=>{
                            if (res.data.status=="ok") {
                                this.loading = false
                                this.$message.success("添加商品成功。")
                            }else{
                                this.loading = false
                                this.$message.error("添加商品失败。")
                            }
                        })

                        row.id="已添加"
                        this.master_user.data.splice(index, 1, row)

                    }else{
                        let params = {
                            good_id: row.id,
                            name: row.name,
                            price: row.price,
                            coupon_price: row.coupon_price,
                            storage: row.storage,
                            description: row.description,
                            image_id: row.image_id,
                            hidden: row.hidden
                        }
                        axios.post('/admin/modifygood', params, axiosConfig).then((res)=>{
                            if (res.data.status=="ok") {
                                this.loading = false
                                this.$message.success("修改商品信息成功。")
                            }else{
                                this.loading = false
                                this.$message.error("修改商品信息失败。")
                            }
                        })
                    }
                    row.isSet = false;
                    this.master_user.data.splice(index, 1, row)
                }else{
                    this.master_user.sel = JSON.parse(JSON.stringify(row))
                    row.isSet = true
                    this.master_user.data.splice(index, 1, row)
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
    .el-tag + .el-tag {
        margin-left: 10px;
    }
    .button-new-tag {
        margin-left: 10px;
        height: 32px;
        line-height: 30px;
        padding-top: 0;
        padding-bottom: 0;
    }
    .input-new-tag {
        width: 90px;
        margin-left: 10px;
        vertical-align: bottom;
    }
</style>



