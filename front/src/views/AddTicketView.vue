<script>
import axios from "axios";
import { defineComponent, ref } from "vue";
import param from "../param/param"
import router from "../router";

export default defineComponent({
  name: 'AddTicketView',
  components: {},
  async setup() {

    let listePrioritesForm = [];
    let response = await axios.get(param.backUrl+"listPriorite.php");
    if(response.data) listePrioritesForm = response.data;

    let listeTypesTicketsForm = [];
    response = await axios.get(param.backUrl+"listType.php");
    if(response.data) listeTypesTicketsForm = response.data;

    let titre = ref("");
    let desc = ref("");
    let page = ref("");
    let idTypeTicket = ref(Object.keys(listeTypesTicketsForm)[0]);
    let idPriorite = ref(Object.keys(listePrioritesForm)[0]);

    const sendForm = async () => {

      var ticketFormData = new FormData();
      ticketFormData.append("titre", titre.value);
      ticketFormData.append("desc", desc.value);
      ticketFormData.append("page", page.value);
      ticketFormData.append("idTypeTicket", idTypeTicket.value);
      ticketFormData.append("idPriorite", idPriorite.value);

      await axios.post(
              param.backUrl+"createTicket.php",
              ticketFormData
      );

      await router.replace({ path: '/' });

    };

    return { sendForm, idTypeTicket, idPriorite, page, desc, titre, listePrioritesForm, listeTypesTicketsForm };
  }
});

</script>

<template>

  <main>

    <router-link to="/">&lt; Liste des tickets</router-link>

    <form @submit.prevent="sendForm" action="">

      <div style="display: flex; justify-content: space-between">
        <div>
          <label for="select-type">Type *</label>
          <select v-model="idTypeTicket" name="type" id="select-type">
            <option :value="key" v-for="(ticket, key) in listeTypesTicketsForm">{{ticket.nomTypeTicket}}</option>
          </select>
        </div>

        <div>
          <label for="select-priorite">Priorité *</label>
          <select v-model="idPriorite" name="priorite" id="select-priorite">
            <option :value="key" v-for="(priorite, key) in listePrioritesForm">{{priorite.nomPriorite}}</option>
          </select>
        </div>

      </div>
      
      <div>
          <label for="input-titre">Titre *</label>
          <input v-model="titre" id="input-titre" name="titre" type="text" required>
      </div>

      <div>
        <label for="input-desc">Description *</label>
        <input v-model="desc" id="input-desc" name="desc" type="text" required>
      </div>

      <div>
        <label for="input-page">Page concernée</label>
        <input v-model="page" id="input-page" name="page" type="text">
      </div>

      <button type="submit">Envoyer</button>
    </form>

  </main>

</template>

<style>
  label, input {
    display: block;
    width: 100%;
  }

  form {
    margin-top: 30px;
    padding: 20px 40px 20px;
    background-color: #f5f5f5;
    border-radius: 20px;
  }

  input, select {
    margin-bottom: 30px !important;
  }

</style>