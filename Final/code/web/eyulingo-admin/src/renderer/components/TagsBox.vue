<template>
    <div>
        <el-tag
                :key="tag"
                v-for="tag in dynamicTags"
                closable
                :disable-transitions="false"
                @close="handleClose(tag)">
            {{tag}}
        </el-tag>
        <el-input
                class="input-new-tag"
                v-if="inputVisible"
                v-model="inputValue"
                ref="saveTagInput"
                size="small"
                @keyup.enter.native="handleInputConfirm"
                @blur="handleInputConfirm">
        </el-input>
        <el-button v-else class="button-new-tag" size="small" @click="showInput">+ 贴标签</el-button>
    </div>
</template>

<script>
    import axios from 'axios'
    axios.defaults.baseURL="http://47.103.15.32:8081"
    export default {
        name: 'tagsBox',
        props: {
            tags: Array,
            goodId: Number
        },
        data() {
            return {
                dynamicTags: this.tags,
                inputVisible: false,
                inputValue: ''
            }
        },
        methods: {
            handleClose(tag) {
                this.dynamicTags.splice(this.dynamicTags.indexOf(tag), 1)
                let params = {
                    good_id: this.goodId,
                    tag_name: tag
                }
                let axiosConfig = {
                    headers: {
                        'Content-Type': 'application/json;charset=UTF-8',
                        'Access-Control-Allow-Origin': "*"
                    }
                }
                axios.post('/admin/deletetag', params, axiosConfig).then((res)=>{
                    if (res.data.status=="ok") {
                        this.$message.success('移除标签成功。')
                    }else{
                        this.$message.error('移除标签失败。')
                    }
                })
            },

            showInput() {
                this.inputVisible = true
                this.$nextTick(_ => {
                    this.$refs.saveTagInput.$refs.input.focus()
                })
            },

            handleInputConfirm() {
                let inputValue = this.inputValue
                if (inputValue) {
                    this.dynamicTags.push(inputValue)
                    let params = {
                        good_id: this.goodId,
                        tag_name: inputValue
                    }
                    let axiosConfig = {
                        headers: {
                            'Content-Type': 'application/json;charset=UTF-8',
                            'Access-Control-Allow-Origin': "*"
                        }
                    }
                    axios.post('/admin/addtag', params, axiosConfig).then((res)=>{
                        if (res.data.status=="ok") {
                            this.$message.success('添加标签成功。')
                        }else{
                            this.$message.error('添加标签失败。')
                        }
                    })
                }
                this.inputVisible = false
                this.inputValue = ''
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
