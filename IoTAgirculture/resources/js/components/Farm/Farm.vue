<template>
  <div>
<!--    <div>-->
<!--      &lt;!&ndash;========== ADMIN SIDE MENU one ========&ndash;&gt;-->
<!--      <div class="_1side_menu" >-->
<!--        <div class="_1side_menu_logo">-->
<!--          <h3 style="text-align:center;">Logo Image</h3>-->
<!--          &lt;!&ndash;<img src="/img/logo.jpg" style="width: 108px;margin-left: 68px;"/>&ndash;&gt;-->
<!--        </div>-->
<!--        &lt;!&ndash;========== ADMIN SIDE MENU ========&ndash;&gt;-->
<!--        <main-navbar />-->
<!--      </div>-->

<!--      &lt;!&ndash;========= HEADER ==========&ndash;&gt;-->
<!--      <div class="header">-->
<!--        <div class="_2menu _box_shadow">-->
<!--          <div class="_2menu_logo">-->
<!--            <ul class="open_button">-->
<!--              <li>-->
<!--                <Icon type="ios-list" />-->
<!--              </li>-->
<!--            </ul>-->
<!--          </div>-->
<!--        </div>-->
<!--      </div>-->
<!--      &lt;!&ndash;========= HEADER ==========&ndash;&gt;-->
<!--    </div>-->
<!--    <div class="content-fluid">-->
<!--      <div class="container">-->
<!--        <card>-->
<!--          <div class="search-content">-->
<!--            <vs-row>-->
<!--              <vs-col vs-type="flex" vs-lg="3" vs-sm="6" vs-xs="12" class="mb-3 lg:pl-2">-->
<!--                <div>-->
<!--                  <vs-input class="inputx w-full" label="Farm name" v-model="farmNameSearch"></vs-input>-->
<!--                </div>-->
<!--              </vs-col>-->
<!--            </vs-row>-->
<!--            <div class="search-btn-block">-->
<!--              <vs-row class="mt-3">-->
<!--                <vs-col vs-type="flex" vs-align="flex-end" vs-justify="flex-end"  vs-w="12">-->
<!--                  <vs-button class="square btn-search" color="primary" @click="onSearch(true, true)"><i class="fas fa-search"></i>Search</vs-button>-->
<!--                </vs-col>-->
<!--              </vs-row>-->
<!--            </div>-->
<!--          </div>-->
<!--        </card>-->

<!--        <card>-->
<!--          <div class="mb-4 block-result">-->
<!--            <div class="search-result">-->
<!--              <div class="search-result-block">-->
<!--                <vs-table class="mt-3"-->
<!--                          :data="listData"-->
<!--                          noDataText="There is no data"-->
<!--                          sst @sort="handleSort" stripe>-->
<!--                  <template slot="thead">-->
<!--                    <vs-th sort-key="name" class="width-150">Name </vs-th>-->
<!--                    <vs-th sort-key="area" class="width-150">Area</vs-th>-->
<!--                    <vs-th sort-key="status" class="width-150">Status</vs-th>-->
<!--                    <vs-th class="width-150">Owner</vs-th>-->
<!--                  </template>-->

<!--                  <template slot-scope="{data}">-->
<!--                    <vs-tr :data="tr" :key="indexTr" v-for="(tr, indexTr) in data">-->
<!--                      <td>{{ tr }}</td>-->
<!--                    </vs-tr>-->
<!--                  </template>-->


<!--                </vs-table>-->
<!--              </div>-->
<!--              <div class="padding-content pagination-block">-->
<!--                <div>-->
<!--                  <div class="mt-3">{{ pagination.totalItem }} 件中 {{ pagination.from ? pagination.from : 0 }} 件から {{ pagination.to ? pagination.to : 0 }} 件までを表示</div>-->
<!--                </div>-->
<!--                <div>-->
<!--                  <PaginationVue :total="pagination.totalPage" :currentPage.sync="pagination.currentPage"></PaginationVue>-->
<!--                </div>-->
<!--              </div>-->
<!--            </div>-->

<!--          </div>-->
<!--        </card>-->

<!--      </div>-->
<!--    </div>-->
  </div>
</template>

<script>
import { mapGetters } from 'vuex'
import MainNavbar from "../layouts/navbar/MainNavbar";
import PaginationVue from '@ocrv/vue-tailwind-pagination';
import  '@ocrv/vue-tailwind-pagination/dist/style.css';

export default {
  comments: {
    MainNavbar,
    PaginationVue
  },

  data() {
    return {
      farmNameSearch: '',
      orderBy: '',
      orderDir: '',
      listData: {},
      pagination: {
        totalPage:0,
        currentPage: 1,
        limit: 10,
        totalItem: 0,
        from: 1, to: 10
      },
    };
  },

  methods: {
    onSearch(resetPaging) {

    },
    handleSort(key, active) {
      this.orderBy = key;
      this.orderDir = active ? "DESC" : "ASC";
      this.onSearch(false);
    }
  },



  computed: mapGetters({

  }),
  watch: {
    async 'pagination.currentPage' (val) {
      await this.onSearch(false);
      console.log('pagination.currentPage');
    },

  }
}
</script>

<style scoped>
.top-right {
  position: absolute;
  right: 10px;
  top: 18px;
}

.title {
  font-size: 85px;
}
</style>
