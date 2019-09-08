<template>
    <div>
        <el-tag
                :key="tag"
                v-for="tag in dynamicTags"
                :disable-transitions="true">
            {{tag}}
        </el-tag>
        <el-text
                class="input-new-tag"
                v-if="inputVisible"
                v-model="inputValue"
                ref="saveTagInput"
                size="small"
                @keyup.enter.native="handleInputConfirm"
                @blur="handleInputConfirm">
        </el-text>
    </div>
</template>

<script>

    export default {
        name: 'readOnlyTagsBox',
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
