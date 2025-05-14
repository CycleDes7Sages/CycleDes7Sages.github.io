# Présentation du projet C7S

Le projet **Canoniser les Sept Sages de Rome (C7S)** vise l'étude du cycle de continuations apportées au _Roman des Sept Sages de Rome_.
Il est co-financé par le FNS (Suisse) et le FNRS (Wallonie-Bruxelles).

Il est dirigé par la prof. Y. Foehr-Janssens (UNIGE) et S. Ventura (ULB, maintenant UPF Barcelona).

Trois postdoctorantes y collaborent, en particulier pour établir l'édition du _Roman de Pelyarmenus_ (cinquième des continuations) qui fait le principal objet des fichiers déposés ici : Camille Carnaille (ULB/UNIGE), Prunelle Deleville (UNIGE), Sophie Lecomte (alors ULB). 

Deux doctorants complètent l'équipe, Aminoël Meylan (UNIGE), chargé de l'étude du _Roman de Laurin_ (troisième des continuations du cycle) et Florian-Pierre Zanardi (UNIGE/U. Lyon), qui se consacre au cas particulier du manuscrit BnF fr. 1446 et à l'édition de la version du _Roman de Kanor_ (dernière des continuations) qu'il contient.

Une présentation complète de l'équipe et des objectifs du projet peut se trouver sur le [site Web du projet](https://www.unige.ch/c7s/).

Ce repository GitHub donne accès d'une part à l'édition du _Roman de Pelyarmenus_ et à ses annexes 
(_index nominum et locorum_ et glossaire), 
et d'autre part à l'alignement produit pour ce _Roman de Pelyarmenus_, ainsi que pour l'ensemble du Cycle, qui 
permet de visualiser la matière de l'ensemble du cycle sur la base des manuscrits qui le contiennent (ou l'ont contenu)
dans son entièreté.

## Data package based on the tei-publisher-data-template

TEI Publisher's data template was used to set this repository as a data app to be used with TEI Publisher-generated publication app for C7S.

Separating the data from application code has many benefits, particularly for actively developed applications and data sets. This way changes to your code can be deployed without redeploying and reindexing your data and vice versa. It is also easier to maintain separate repositories (e.g. in Git) and only grant certain privileges separately to editorial and developer teams.
