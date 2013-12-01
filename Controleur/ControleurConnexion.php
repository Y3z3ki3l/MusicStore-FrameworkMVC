<?php

require_once 'Framework/Controleur.php';
require_once 'Modele/Client.php';

/**
 * Contrôleur gérant la connexion au site
 *
 * @author Baptiste Pesquet
 */
class ControleurConnexion extends Controleur
{
    private $client;

    public function __construct()
    {
        $this->client = new Client();
    }

    public function index()
    {
        $this->genererVue();
    }

    public function connecter()
    {
        if ($this->requete->existeParametre("courriel") && $this->requete->existeParametre("mdp")) {
            $courriel = $this->requete->getParametre("courriel");
            $mdp = $this->requete->getParametre("mdp");
            if ($this->client->connecter($courriel, $mdp)) {
                $client = $this->client->getClient($courriel, $mdp);
                $this->requete->getSession()->setAttribut("idClient",
                        $client['idClient']);
                $this->requete->getSession()->setAttribut("prenomClient",
                        $client['prenom']);
                $this->rediriger("accueil");
            }
            else
                $this->genererVue(array('msgErreur' => 'Courriel ou mot de passe incorrects'),
                        "index");
        }
        else
            throw new Exception("Action impossible : courriel ou mot de passe non défini");
    }

    public function deconnecter()
    {
        $this->requete->getSession()->detruire();
        $this->rediriger("accueil");
    }

}