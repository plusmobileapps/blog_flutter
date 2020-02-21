import 'package:blog_flutter/model/article.dart';

class ArticleRepository {
  List<Article> _articles = [
    Article(
        id: '1',
        description:
            'Learn the basic fundamentals of how to make an android app widget',
        minRead: '10 min',
        title: 'How to make an Android application widget',
        url:
            'https://raw.githubusercontent.com/plusmobileapps/dev-articles/master/Android%20App%20Widget.md',
        imageUrl: 'assets/computeranimation.flr',
        body: """
    # Kotlin Multiplatform

I've worked as an Android developer for a couple of years alongside a web and iOS team. We are all tasked with building the same features with complicated business logic all in different languages. 


* Android - Kotlin/Java
* iOS - Swift/Objective C
* Web - Javascript

The business logic portion of any codebase is critical to be of the highest quality in order to ensure the best user experience. When you have 3 separate teams trying to produce the same rules 3 times, the amount of risk for bugs to occur begin to grow greatly. What Kotlin Multiplatform aims to achieve is the ability to begin consolidating this business logic into a common module which can be shared to any target.  

## Why?

**Don't Repeat Yourself (DRY)** 

There are many kinds of architectures that exist out in the mobile world: 

* MVP - Model-View-Presenter
* MVVM - Model-View-ViewModel
* MVC - Model-View-Controller
* MVI - Model-View-Intent



### Resources

[DZone article - The Future of Cross-Platform Is Native: A Case for Kotlin Multiplatform](https://dzone.com/articles/future-of-cross-platform-is-native-a-case-for-kotl)


    """),
    Article(
        id: '2',
        description:
            'Learn how to use git without ever needing to login through the terminal',
        minRead: '5 min',
        title: 'SSH into a git remote repo',
        url:
            'https://raw.githubusercontent.com/plusmobileapps/dev-articles/master/SSH.md',
        imageUrl: 'assets/computeranimation.flr',
    body: """
    # How to Use SSH with Git and Setup for Multiple Accounts
Before getting into the professional field of software development, I had always used https for cloning all of my git repositories. It wasn't until I started juggling three different github accounts between personal, school, and work, that I realized there had to be a better way. In comes **secure shell**, or **SSH** for short, to never need to enter in a login password again!

## What is SSH?
//TODO:

 
## Check for existing Key
It is a good idea to first check if there is already a default key on your computer by looking at the default folder for a mac where ssh keys are kept running `ls -l ~/.ssh`. If one exists already, the default names should be `id_rsa` and `id_rsa.pub`. If neither are there, then you'll learn how to make one in the next step. 
## Creating the Key
If you don't have a key already or want to setup a key for a different email account. Then run the following command entering with the desired email. For simplicity of commands, let's switch to the `/.ssh` directory for now. 

```
cd ~/.ssh
ssh-keygen -t rsa -C "your-email-address"
```
You should then be prompted to enter the name to save the files as, feel free to name what ever you want. To follow suit of the default, I named mine as `id_rsa_COMPANY`, `id_rsa_SCHOOL`, `id_rsa_DEVELOP`.

Next, you will be asked to enter a passphrase to encrypt the private and public key. If you do not wish to enter one, simply press enter twice to confirm although this is not recommended. 

Great, now you just created an SSH key associated for that email account!

## Save the SSH Passphrase to Your System
If you created a SSH key with a unique name and don't want to enter this passphrase from the previous step every time. Then enter the following command. 

```
ssh-add id_rsa_DEVELOP
```
Now enter the passphrase you just entered in the previous step.

##What are These `id_rsa` Files?
`id_rsa` is your **private key** for the account and should never leave your machine, as this is what your computer uses to sign any work done for this account. 

`id_rsa.pub` is the **public key** for the account, this is what you will use to enter on what ever version control system (VCS) you desire, such as github. 

## Adding Public Key to VCS
Log into whatever version control system you use, for my use case I use GitHub. Typically if you go into the settings, there should be a section for SSH and GPG keys. Click new SSH key and for the title, enter the name of the device you will be able to identify it such as `personal-desktop` and then copy-paste the contents of the `id_rsa.pub` file into the key section. Finally click add SSH key!

## Configuring Private Keys
So now that you've created a key and associated it with your appropriate version control, its time to make a config file so your computer can know how to communicate with your version control using the private key. Still in the `.ssh` folder, check if a `config` file exists with `ls -l`. If not not, run:

```
touch ~/.ssh/config    //creates a blank config file
atom config				//open with atom editor, feel free to use your own editor
```
Now working in the `config` file, lets setup our personal account that we will be using the most to clone repos. Enter the following block of code. 

```
#Default GitHub
Host github.com
  HostName github.com
  User git
  IdentityFile ~/.ssh/id_rsa
```
This will allow you to clone repositories using the SSH urls just like: 
```
git clone git@github.com:username/repo-name
```

## Configure Multiple Emails
Let's say for example you have a repository that you need to access at work and you want all associated work to be made with that email account. Opening the `config` file again, enter the following block of code. 

```
Host github-COMPANY
  HostName github.com
  User git
  IdentityFile ~/.ssh/id_rsa_COMPANY
```
Now if you ever need to clone a repository from this account, simply replace `github.com` with `github-COMPANY` like:

```
git clone git@github-COMPANY:username/repo-name
```
I recommend setting up work and school emails this way since I only clone one repository from work and a small handful for school. 

## Conclusion
Now any repos you clone, all work that is commited will be logged as that email and you'll never need to constantly log into different accounts. 



### References

[Secure shell general info](https://www.digitalocean.com/community/tutorials/understanding-the-ssh-encryption-and-connection-process)


[Create multiple accounts](https://code.tutsplus.com/tutorials/quick-tip-how-to-work-with-github-and-multiple-accounts--net-22574)
    """),
  ];

  Article getArticle(String id) {
    Article ret;
    for (int i = 0; i < _articles.length; i++) {
      Article article = _articles[i];
      if (article.id == id) {
        ret = article;
        break;
      }
    }
    return ret;
  }

  List<Article> getArticles() {
    return _articles;
  }
}
