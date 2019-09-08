<template>
  <div class="login-container">
      <el-form ref="form" :model="form" v-loading="loading">
          <el-row type="flex" justify="center">
              <el-col :span="6">
                  <el-form-item >
                    <span><font  size="4">经销商登录</font></span>
                  </el-form-item>
              </el-col>
          </el-row>
          <el-row type="flex" justify="center">
              <el-col :span="12">
                  <el-form-item  prop="name">
                      <el-input v-model="form.name" size="small" placeholder="账户" clearable></el-input>
                  </el-form-item>
              </el-col>
          </el-row>
          <el-row type="flex" justify="center">
              <el-col :span="12">
                  <el-form-item  prop="password">
                      <el-input v-model="form.password" size="small" placeholder="密码" show-password></el-input>
                  </el-form-item>
              </el-col>
          </el-row>
          <el-row type="flex" justify="center" style="margin: 15px">
              <el-col :span="12">
                  <el-form-item >
                      <el-button type="primary" @click="submit">登录</el-button>
                  </el-form-item>
              </el-col>
          </el-row>
      </el-form>
  </div>
</template>

<script>
import axios from 'axios'
//axios.defaults.baseURL="http://localhost:8080"
axios.defaults.baseURL="http://47.103.15.32:8082"
export default {
  name: 'Login',
  data () {
    return {
        form:{
            name:'',
            password:'',
        },
		loading: false
    }
  },
  methods:{
      /*提交进行判断的函数 */
      submit:function(){

        this.loading = true
        axios.post('/store/login?username='+this.form.name+'&password='+this.form.password).then((res)=>{
            console.log(res)
            if (res.data.status == "ok") {
                this.loading = false
                alert("登录成功，您好，"+this.form.name+"！")
                this.$router.replace({
                    path:'/distInfo'
                })
            }else{
                this.loading = false
                alert("登录失败")
            }				
        })
      }
  }
}
</script>

<style>

.login-container {
    border-radius: 15px;
    background-clip: padding-box;
    margin: 180px auto;
		width: 400px;
		height: 290px;
    padding: 35px 35px 15px 35px;
    background: #fff;
    border: 1px solid #eaeaea;
    box-shadow: 0 0 25px #cac6c6;
  }

</style>
