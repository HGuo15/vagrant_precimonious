# vagrant_precimonious
a vagrant box for precimonious

Prerequisites  
---------------------------------------  
To use vagrant_precimonious, vagrant and virtual box are required to be installed first.  
1 install vagrant: https://www.vagrantup.com/downloads.html  
2 install virtual box:  https://www.virtualbox.org/wiki/Downloads  

Usage  
--------------------------------------  
1 Create a directory named vagrant_precimonious:  
  mkdir vagrant_precimonious  
  cd vagrant_precimonious  
2 Dowanload box:  
  vagrant box add precimonious http://files.vagrantup.com/precise64.box  
3 Initialized base machine:  
  vagrant init precimonious  
4 Dowanload vagrant_precimonious from this repository to your vagrant_precimonious directory(the Vagrantfile will be overwritten)  
5 Run:  
  vagrant up  
  vagrant ssh  
