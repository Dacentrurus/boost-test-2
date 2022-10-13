<script>
import axios from "axios";
import { defineComponent, ref } from "vue";
import param from "../param/param"

export default defineComponent({
  name: 'TableView',
  components: {},
  async setup() {

    let listePriorites = [];
    let response = await axios.get(param.backUrl+"listPriorite.php");
    if(response.data) listePriorites = response.data;

    console.log(listePriorites);

    let listeStatuts = [];
    response = await axios.get(param.backUrl+"listStatut.php");
    if(response.data) listeStatuts = response.data;

    console.log(listeStatuts);

    let listeTypesTickets = [];
    response = await axios.get(param.backUrl+"listType.php");
    if(response.data) listeTypesTickets = response.data;

    console.log(listeTypesTickets);

    let listeTickets = [];
    response = await axios.get(param.backUrl+"listTicket.php");
    if(response.data) listeTickets = response.data;

    console.log(listeTickets);



    return { listeTickets, listePriorites, listeTypesTickets };

  }
});

</script>

<template>

  <main>

    <router-link to="addTicket">Ajouter un ticket</router-link>

    <div class="selection">
      Afficher les tickets
      <select name="select-statut" id="select-statut">
        <option value="all" selected>tous</option>
      </select>
      et
      <select name="select-type" id="select-type">
        <option value="all" selected>tous</option>
      </select>
    </div>

    <div>

      <table>
        <tr>
          <td>#</td>
          <td>TYPE</td>
          <td>TITRE</td>
          <td>STATUT</td>
          <td>PRIORITÉ</td>
          <td>DERNIÈRE ACTIVITÉ</td>
        </tr>

        <tr :key="ticket.idTicket" v-for="ticket in listeTickets">
          <td>{{ticket.idTicket}}</td>
          <td>{{listeTypesTickets[ticket.idTypeTicket].nomTypeTicket}}</td>
          <td>{{ticket.titreTicket}}</td>
          <td>Statut</td>
<!--          <td class="colored"><span :style="{backgroundColor: listeStatuts[ticket.idStatut].couleurStatut+'aa'}">{{listeStatuts[ticket.idStatut].nomStatut.toLowerCase()}}</span></td>-->
          <td class="colored"><span :style="{backgroundColor: listePriorites[ticket.idPrioriteTicket].couleurPriorite+'aa'}">{{listePriorites[ticket.idPrioriteTicket].nomPriorite.toLowerCase()}}</span></td>
          <td>{{ticket.lastUser + " - " + ticket.dateActivite}}</td>
        </tr>
      </table>


    </div>



  </main>

</template>

<style>

  main {
    margin: 0 auto;
  }

  tr:first-of-type {
    background-color: #eeeeee;
    font-size: 13px;

  }

  tr:not(:first-of-type):hover {
    background-color: #e5e5e5;
    cursor: pointer;
  }

  .selection, table {
    margin-top: 30px;
  }

  table {
    border: 1px solid gray;
    border-collapse: collapse;
  }

  td {
    padding: 10px;
    text-align: center;
  }

  td.colored > span {
    padding: 5px 10px;
    border-radius: 10px;
    font-size: 12px;
  }


</style>