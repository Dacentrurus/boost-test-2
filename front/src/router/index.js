import { createRouter, createWebHistory } from 'vue-router'
import TableView from '../views/TableView.vue'
import AddTicketView from "../views/AddTicketView.vue";

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'home',
      component: TableView
    },
    {
      path: '/addTicket',
      name: 'addTicket',
      component: AddTicketView
    },
    {
      path: '/about',
      name: 'about',
      // route level code-splitting
      // this generates a separate chunk (About.[hash].js) for this route
      // which is lazy-loaded when the route is visited.
      component: () => import('../views/AboutView.vue')
    }
  ]
})

export default router
