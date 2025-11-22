# Documentation Technique des Données (Projet C7S)

Ce document complète le README principal en détaillant l'organisation des données scientifiques.

## 1. Architecture du Dépôt
Ce dépôt est structuré selon le modèle "TEI Publisher Data Package".
- **data/** : Contient les données sources.
  - `pelyarmenus/` : Corpus principal (texte édité en XML-TEI).
  - `alignment/` : Fichiers d'alignement structurel (Stand-off).
  - `registers/` : Index (nominum/locorum) et glossaires.
- **odd/** : Schémas de validation ODD et documentation générée.
- **SCRIPTS/** : Feuilles de style XSLT pour la transformation des données.

## 2. Identification des fichiers
Les fichiers suivent une nomenclature descriptive pour faciliter l'identification de leur contenu :
- **Alignements :** Identifiés par le préfixe `Alignment_` (ex: `Alignment_C7S.xml`, `Alignment_Pelyarmenus.xml`).
- **Index :** Identifiés par le préfixe `Index-` suivi du nom de l'œuvre (ex: `Index-Roman-de-Pelyarmenus.xml`).
- **Sources TEI :** Les fichiers du corpus sont organisés par chapitres ou sections dans le dossier `data/pelyarmenus`.

## 3. Validation et Usage
- **Validation :** La structure des fichiers XML est régie par le schéma ODD situé dans `odd/Pelyarmenus.odd`.
- **Transformation :** Les données sont conçues pour être transformées via les scripts XSLT (dossier `SCRIPTS/`) ou via l'application TEI Publisher configurée dans ce dépôt.
