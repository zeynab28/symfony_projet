<?php

namespace App\DataFixtures;

use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Common\Persistence\ObjectManager;
use App\Entity\Employe;

class EmployeFixtures extends Fixture
{
    public function load(ObjectManager $manager)
    {
        for($i = 1; $i<=10; $i++){
        $employe=new Employe();
        $employe->setMatricule("mat1 n-$i")
                ->setNomcomplet("oumydiop")
                ->setDatenaiss(new \DateTime())
                ->setSalaire(50000);
                $manager->persist($employe);
            }

        $manager->flush();

    }
}
