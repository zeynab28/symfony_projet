<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;
use App\Entity\Employe;
use Symfony\Component\HttpFoundation\Request;
use Doctrine\Common\Persistence\ObjectManager;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use App\Form\EmployeType;
use Symfony\Component\Form\Extension\Core\Type\DateType;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use App\Entity\Service;

class BlogController extends AbstractController
{
    /**
     * @Route("/blog", name="blog")
     */
    public function index()
    {
        $repo = $this->getDoctrine()->getRepository(Employe::class);
        $employes = $repo->findAll();

        return $this->render('blog/index.html.twig', [
            'controller_name' => 'BlogController',
            'employes' => $employes
        ]);
    }
    /**
     * @Route("/blog/supprimer/{id}", name="blog_supprimer")
     */
    public function supprimer(Employe $employes){
        $emp = $this->getDoctrine()->getManager();
        $emp->remove($employes);
        $emp->flush();

        return $this->redirectToRoute('blog', ['id' => $employes->getId()]); 
    }
    /**
     * @Route("/", name="home")
     */
    public function home(){
        return $this->render('blog/home.html.twig');
    }
 /**
     * @Route("/blog/new", name="blog_create")
     * @Route("/blog/{id}/edit", name="blog_edit")
     */
    public function form(Employe $employe=null,Request $request, ObjectManager $manager){
       
       if(!$employe){
          $employe = new Employe();
       }

        
                     $form = $this->createFormBuilder($employe);
                            $form ->add('matricule');
                            $form ->add('nomcomplet');
                            $form ->add('datenaiss',DateType::class, [
                'widget' => 'single_text',
                'format' => 'yyyy-MM-dd',
            ]);
                              $form->add('salaire');
                              $form->add('service', EntityType::class, [
                                'class' => Service::class,
                                'choice_label' => 'libelle'
                            ]);
                             
                              $form=$form->getForm();

        

                     $form->handleRequest($request);
                     //dump($employe);//recupére les données du formulaire
                     if($form->isSubmitted() && $form->isValid()){
                      //   if(!$employe->getId()){
                           // $employe->setDatenaiss(new \DateTime());
                       //     }
                     

                     $manager->persist($employe);
                     $manager->flush();

                     return $this->redirectToRoute('blog_show', ['id' => $employe->getId()]);
                     }
        
        return $this->render('blog/create.html.twig',[
            'formEmploye' => $form->createView(),
            'editMode' => $employe->getId()!==null
        ]);

            }
            

    /**
     * @Route("/blog/{id}", name="blog_show")
     */
    public function show($id){

        $repo = $this->getDoctrine()->getRepository(Employe::class);
         $employe = $repo->find($id);

        return $this->render('blog/show.html.twig',
    [ 'article' => $employe ]);
    }
   
}
