//Variables a modifier pour les modules
size_cube    = 10;
size_plateau  = 10;
epaisseur_plateau = 2;
epaisseur_pion    = 2;
couleur_joueur1 = [1,0,0];
couleur_joueur2 = [0,0,1];

//Creation du plateau 
module plateau(size_cube,size_plateau,epaisseur_plateau)
{
    for(i = [1:size_plateau] )
    {
        for( j = [1:size_plateau] )
        {
            //Pour alterner les series de chaque suites de couleurs.
            if(j%2==0)
            {
                //On verifie le module de i pour savoir --> si =0 case blanche sinon noire
                if(i%2==0)
                {
                    translate([(j-1)*size_cube,(i-1)*size_cube,0]) color([1,1,1]) cube([size_cube,size_cube,epaisseur_plateau]) ;
                }
                else
                {
                    translate([(j-1)*size_cube,(i-1)*size_cube,0]) color([0,0,0]) cube([size_cube,size_cube,epaisseur_plateau]) ;
                }
                
            }
            //Sinon on fait l operation inverse pour finir de faire le damier
            else
            {
                //On verifie le module de i pour savoir --> si =1 case blanche sinon noire
                if(i%2==1)
                {
                    translate([(j-1)*size_cube,(i-1)*size_cube,0]) color([1,1,1]) cube([size_cube,size_cube,epaisseur_plateau]) ;
                }
                else
                {
                    translate([(j-1)*size_cube,(i-1)*size_cube,0]) color([0,0,0]) cube([size_cube,size_cube,epaisseur_plateau]) ;
                }
            } 
        }//Fin boucle pour j
    }//Fin boucle pour i
}
    
//Ajout des pions sur le plateau    
module pions(joueur1=[1,0,0],joueur2=[0,0,1],epaisseur_pion)
{
    for(i = [1:size_plateau] )
    {
        for( j = [1:size_plateau] )
        {
            if(j%2==0)
            {
                if(i%2==1)
                {
                    if(i<size_plateau/2)
                    {
                        translate([(j-1/2)*size_cube,(i-1/2)*size_cube,1])  color(couleur_joueur1) linear_extrude (height=epaisseur_pion) circle(size_cube/2,size_cube/2,epaisseur_pion,$fn=300); 
                    }
                    else if(i>(size_plateau/2)+1)
                    {
                        translate([(j-1/2)*size_cube,(i-1/2)*size_cube,1])  color(couleur_joueur2) linear_extrude (height=epaisseur_pion) circle(size_cube/2,size_cube/2,2,$fn=300); 
                    }
                }
            }
            else
            {
                if(i%2==0)
                {
                    if(i<size_plateau/2)
                    {
                        translate([(j-1/2)*size_cube,(i-1/2)*size_cube,1])  color(couleur_joueur1) linear_extrude (height=epaisseur_pion) circle(size_cube/2,size_cube/2,epaisseur_pion,$fn=300);                      
                    }
                    else if(i>(size_plateau/2)+1)
                    {
                        translate([(j-1/2)*size_cube,(i-1/2)*size_cube,1])  color(couleur_joueur2) linear_extrude (height=epaisseur_pion) circle(size_cube/2,size_cube/2,epaisseur_pion,$fn=300); 
                    }
                }
            } 
        }//Fin boucle pour j
    }//Fin boucle pour i
}

module damier()
{
    plateau(size_cube,size_plateau,epaisseur_plateau);
    pions(couleur_joueur1,couleur_joueur2,epaisseur_pion);
}

//Appel du module damier compose du plateau et des pions
damier();