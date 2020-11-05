package libs

import (
	"design-4-green/models"
	"encoding/csv"
	"io"
	"os"
	"path/filepath"
	"runtime"
	"strconv"
	"sync"

	"github.com/astaxie/beego"
	"github.com/astaxie/beego/orm"
	"github.com/astaxie/beego/utils"
)

// Determine la taille max d'un bloc d'insertion
const TailleBlocInsert = 100

// ImportDepuisCSV importe les fichiers CSV situé dans le dossier CSV du projet.
func ImportDepuisCSV() error {
	csvCommune := ouvrirCSV("Commune_avec_rang")
	defer csvCommune.Close()
	csvDepartement := ouvrirCSV("Departement")
	defer csvDepartement.Close()
	csvRegion := ouvrirCSV("Region")
	defer csvRegion.Close()

	o := orm.NewOrm()
	readerCommune := csv.NewReader(csvCommune)
	readerDepartement := csv.NewReader(csvDepartement)
	readerRegion := csv.NewReader(csvRegion)

	var listeDepartement []*models.Departement
	var listeRegion []*models.Region

	//Ignore les titres de colonnes
	if _, err := readerCommune.Read(); err != nil {
		beego.Error(err)
	}
	if _, err := readerDepartement.Read(); err != nil {
		beego.Error(err)
	}
	if _, err := readerRegion.Read(); err != nil {
		beego.Error(err)
	}

	for {
		record, err := readerRegion.Read()
		if err == io.EOF {
			break
		}
		if err != nil {
			beego.Error(err)
		}

		r := &models.Region{
			ID:          atoi(record[0]),
			Nom:         record[1],
			ScoreGlobal: atoi(record[2]),
		}
		listeRegion = append(listeRegion, r)
	}

	if _, err := o.InsertMulti(TailleBlocInsert, listeRegion); err != nil {
		beego.Error(err)
	}

	for {
		record, err := readerDepartement.Read()
		if err == io.EOF {
			break
		}
		if err != nil {
			beego.Error(err)
		}

		d := &models.Departement{
			ID:          atoi(record[0]),
			Nom:         record[1],
			ScoreGlobal: atoi(record[2]),
		}
		listeDepartement = append(listeDepartement, d)
	}

	if _, err := o.InsertMulti(TailleBlocInsert, listeDepartement); err != nil {
		beego.Error(err)
	}

	beego.Debug(runtime.NumCPU())
	chanCommune := make(chan []string, TailleBlocInsert)
	var wg sync.WaitGroup
	for i := 0; i < runtime.NumCPU(); i++ {
		go traitementCommune(o, &wg, chanCommune)
	}

	for {
		record, err := readerCommune.Read()
		if err == io.EOF {
			break
		}
		if err != nil {
			beego.Error(err)
		}
		chanCommune <- record
	}

	close(chanCommune)
	wg.Wait()
	return nil
}

func traitementCommune(o orm.Ormer, wg *sync.WaitGroup, chanCommune chan []string) {
	defer func() {
		wg.Done()
	}()
	wg.Add(1)

	var listeCommune []*models.Commune
	for {
		record, ok := <-chanCommune
		if !ok {
			break
		}
		c := &models.Commune{
			//ID:               atoi(record[0]),
			NomIris:          record[0],
			CodePostal:       record[1],
			NomCommune:       record[2],
			ScoreGlobal:      atoi(record[3]),
			ScoreAccesIntnum: atoi(record[4]),
			ScoreAccesInfo:   atoi(record[5]),
			ScoreCompAdmin:   atoi(record[6]),
			ScoreCompNumsco:  atoi(record[7]),
			Region:           &models.Region{ID: atoi(record[8])},
			Departement:      &models.Departement{ID: atoi(record[9])},
			Rang:             atoi(record[10]),
		}

		listeCommune = append(listeCommune, c)
	}

	if _, err := o.InsertMulti(TailleBlocInsert, listeCommune); err != nil {
		beego.Error(err)
	}

}

// OuvrirCSV ouvre le fichier passé en paramètre pour la lecture. En cas de succès,
// le fichier peut être lu à l'aide des méthode de os.File.
func ouvrirCSV(table string) *os.File {
	var fichier string

	if fichier = filepath.Join("csv", table+".csv"); !utils.FileExists(fichier) {
		beego.Error("Le ficher CSV", table, "est inexistant")
	}

	csv, err := os.Open(fichier)
	if err != nil {
		beego.Error(err)
	}

	return csv
}

// atoi permet la conversion ascii to int sans avoir à traiter le message d'erreur
func atoi(str string) int {
	s := 0
	var err interface{}

	if s, err = strconv.Atoi(str); err != nil {
		beego.Error(err)
	}
	return s
}
