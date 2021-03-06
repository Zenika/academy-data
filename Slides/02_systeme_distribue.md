# Système distibué

<!-- .slide: class="page-title" -->



## Plan

<!-- .slide: class="toc" -->

- [Introduction](#/1)
- **[Système distribué](#/2)**
- [Cluster et gestionnaires de cluster](#/3)
- [Calcul distribué : Spark en action](#/4)
- [Tour des outils du monde de la data](#/5)
- [RGPD](#/6)



## Système distribué

- **Stockage distribué**
- Calcul distribué
- Négociateur de ressources



# Stockage distribué

<!-- .slide: class="page-title" -->



## Une autre solution

>> On ne devrait pas chercher des ordinateurs plus puissants, mais plutôt plus de systèmes d'ordinateurs. (**Grace Hopper**)



## Principes

- Tolérant aux pannes
- Scalable horizontalement
- Synchronisation
- Disponible
- Complexité non visible



## Notion de fichiers distribués
<figure>
      <img src="ressources/images/02_systeme_distribue/blocks.jpg" style="margin: 0 auto; width: 100%"/>
</figure>



## Notion de racks

<figure>
      <img src="ressources/images/02_systeme_distribue/racks.jpg" style="margin: 0 auto; width: 100%"/>
</figure>



## HDFS (Hadoop Distributed File System, suite Hadoop)

<figure>
      <img src="ressources/images/02_systeme_distribue/hdfs.jpg" style="margin: 0 auto; width: 40%"/>
</figure>



## DataLake (Lac de données)
>>  Un lac de données (en anglais data lake) est une méthode de stockage des données utilisée par le big data (mégadonnées en français). Ces données sont gardées dans leurs formats originaux ou sont très peu (**Wikipedia**)

<br/><br/>
*=> Centralisation*




## Focus HDFS : lire dossiers

`hdfs dfs -ls`

<br/>

`hdfs dfs -ls /user`

<br/></br/><br/> 

*=> Notion d'utilisateur HDFS*



## Focus HDFS : lire fichier

`hdfs dfs -text exemple/test`

<br/>

`hdfs dfs -tail exemple/test`



## Focus HDFS : récupérer fichier

`hdfs dfs -get exemple/test test` 



## Focus HDFS : créer dossier

`hdfs dfs -mkdir exemple`



## Focus HDFS : ajouter fichier

`hdfs dfs -put test exemple/`



## Focus HDFS : Supprimer fichier

`hdfs dfs -rm test`



## Focus HDFS : Supprimer dossier

`hdfs dfs -rm -r exemple`



# TP 1 : HDFS

<!-- .slide: class="page-title" -->



## Système distribué

- Stockage distribué
- **Calcul distribué**
- Négociateur de ressources



# Calcul distribué

<!-- .slide: class="page-title" -->



## Un programme distribué

- Hadoop Map Reduce
- Spark

<br/>
*Capacité à distribuer le travail*



## Tâches distribuées

<figure>
      <img src="ressources/images/02_systeme_distribue/computing.jpg" style="margin: 0 auto; width: 90%"/>
</figure>



## Tâches distribuées en rapport avec la donnée

<figure>
      <img src="ressources/images/02_systeme_distribue/data.jpg" style="margin: 0 auto; width: 90%"/>
</figure>



## Data locality

<figure>
      <img src="ressources/images/02_systeme_distribue/here.jpg" style="margin: 0 auto; width: 60%"/>
</figure>



## Data local

<figure>
      <img src="ressources/images/02_systeme_distribue/local.jpg" style="margin: 0 auto; width: 30%"/>
</figure>



## Intra rack

<figure>
      <img src="ressources/images/02_systeme_distribue/intra_rack.jpg" style="margin: 0 auto; width: 60%"/>
</figure>



## Inter rack

<figure>
      <img src="ressources/images/02_systeme_distribue/inter_rack.jpg" style="margin: 0 auto; width: 60%"/>
</figure>



## Système distribué

- Stockage distribué
- Calcul distribué
- **Négociateur de ressources**



# Négociateur de ressources


<!-- .slide: class="page-title" -->




## Qu'est-ce qui est négocié ?
- CPU
- RAM
- Data locality



## Exemple avec YARN (YET ANOTHER RESOURCE NEGOTIATOR, suite Hadoop)

<figure>
      <img src="ressources/images/02_systeme_distribue/yarn.jpg" style="margin: 0 auto; width: 40%"/>
</figure>



## YARN + HDFS

<figure>
      <img src="ressources/images/02_systeme_distribue/yarn_hdfs.jpg" style="margin: 0 auto; width: 40%"/>
</figure>



## Hadoop Map Reduce en action avec YARN pour la data locality

<figure>
      <img src="ressources/images/02_systeme_distribue/map_reduce.jpg" style="margin: 0 auto; width: 60%"/>
</figure>




## Commandes YARN

` yarn logs -applicationId <application ID>`



<!-- .slide: class="page-questions" -->
