<template>
  <el-container style="border: 1px solid #eee" direction="vertical">
    <el-header style="text-align: right; font-size: 12px">
      <span></span>
    </el-header>

    <el-container>
      <el-aside style="width: 200px; background-color: rgb(238, 241, 246)">
        <el-menu router default-active="/distInfo">
          <el-menu-item index="/distInfo">我的信息</el-menu-item>
          <el-menu-item index="/storeInfo">我的店铺</el-menu-item>
          <el-menu-item index="/goodsInfo">商品信息</el-menu-item>
          <el-menu-item index="/orderInfo">我的订单</el-menu-item>
          <el-menu-item @click="dist_logout()" index="/">退出登录</el-menu-item>
        </el-menu>
      </el-aside>
      <el-main>
        <router-view/>
      </el-main>
    </el-container>
  </el-container>
</template>

<script>
import axios from 'axios'
axios.defaults.baseURL="http://47.103.15.32:8082"
export default {
    
    data() {
        return {
            count: 0
        }
    },
    methods: {
        dist_logout() {
           
                axios.post('/logout', {}).then((res)=>{
                    if (res.data.status=="ok") {
                        this.$router.replace({path:'/'})
                    }
                })
            
        }
    }
}
</script>


<style>
  .el-header {
    background-color: #B3C0D1;
    color: #333;
    line-height: 60px;
  }
  
  .el-aside {
    color: #333;
  }
</style>

<script>
  export default {
    data() {
      return {
        tableData: []
      }
    }
  };
</script>