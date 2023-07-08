include(docm4.m4)

 Decode encrypted message
 ==============================

DOCM4_DIR_NOTICE

  Good evening Mr. Hunt.

  Along with this message, you should find a few software artifacts obtained,
  by undisclosed means, from a confidential source. While many details on the
  origin the material is considered strictly classified, we were informed
  that, according to a trusted Intelligence authority, it can be used to gain
  access to information of utmost strategical value.

  Unfortunately, however, the piece of software which you are now given
  access is secured by access protection mechanisms.
 
  Your mission, should you accept it, is to reverse engineer the software
  fragment and provide an effective mechanism to circumvent the protection.

  Complementary technical information and directions to complete the 
  task follows in the attached specifications.

  As always, should you or any of your team would be caught or killed, the
  Secretary will disavow any knowledge of your actions.

  Well, while it is unlikely that this message self-destruct in five seconds,
  be aware just for the case.


  Mission directions
  --------------------------------

  The Intelligence is informed that a computer program  is being used by a
  suspicious organization to obfuscate the communication between its members.
  Their security workflow requires that received messages be handled once
  within the organization's premises and then destroyed immediately, without
  any data being transferred outside the facility. The network and operational
  protocols are heavily secured to detect any transmission attempting to
  violate this directive.

  As the only resort, special maneuvers have been made, allowing a
  trusted undercover agent to gain local access to docrypt within the
  organization's headquarters. The agent, however, does not have access to
  the secret keys required to execute the program properly: that is why your
  team is being called up. You are expected to perform a technical intervention
  to circumvent the security measures, and allow the agent to gain full access
  to the program resources and thus decode the intercepted communication.

  Naturally, however, as you must presume, this would not be an IMF job
  if conditions were as simple as that.
  
  The target platform in the facility is secured by a mechanism that performs
  a hash-check verification of the program during its loading, and then
  denies the execution if the computed value is not recognized. This method
  rules out any practical possibility of modifying the program or its libraries.

  The only way to break in the protection measures is by exploiting any breach
  in the security mechanism which allows one to perform an external attack.
  
  To test the hacked program, you are also given access to some data
  files with obfuscated contents. If you can successfully decrypt the sample
  files, then the undercover agent will be able to reproduce the operation
  from within the organization's facility.

  Notice, however, that the supplied sample files, including the credentials,
  are incomplete and possibly obsolete files, which will differ from those
  actually in use by the monitored organization. This means that, even if
  the credentials are retrieved from the encrypted file, they will be of
  no use for the field agent.

  For the operation to be considered accomplished, the tactical unity expects
  to receive a distribution compressed file containing the needed software
  components, along with a suitably configured automation build system,
  as detailed below.


  How to deliver the package
  ------------------------------

  a) On this directory issue the command:

     make export

  That should create a tar file named like hack01.*.tar.gz
  
  b) Copy the tar file into your own's project root tree.

     cp  <abolute- path-to-your-own-project>
  
  c) Uncompress de files

     cd <abolute- path-to-your-own-project>
     tar zxvf hack01.*.tar.gz
     cd hack01

  d) Edit, add, remove files as needed.

     (observe that you'll need to add rules to the makefile).

  e) Commit your changes

     git add <list-of-modified-files>
     git commit -m <message>
     git tag hack01
     git push
     git push origin hack01

  f) Have a deserved cup of coffee.

  Technical details
  ------------------------------

     

  The Intelligence already knows that the Organization handles its agents'
  messages through the following workflow:

     - a message is encrypted with the program 'encrypt' by executing:

       $ ./encrypt sample.txt > sample.cry
       
     - the encrypted message 'sample.cry' is received in the Organization's
       headquarters and then decrypted with the program 'docrypt', by
       executing:

       $ ./docrypt sample.cry <dkey>

     - in addition to the decryption key 'dkey', the program 'docrypt' also
       requires the user to provide their credentials; these will be
       checked against the information stored in the encrypted file
       'credentials.cry'.


  Should you want to have a glance on how that workflow is implemented, the
  package you have access to contains some example artifacts that were
  collected along the programs: it's known that the file 'test.cry' was
  encrypted by the user with credentials 'foo', as user name, 'yoda' as
  authorization key, and 'test' as the encryption key. You may use those
  data to decrypt 'test.cry'. As aforementioned, however, bear in mind
  that the actual credentials file used in the organization differs from
  the supplied the example, as well as that the encryption key used by
  the encryption program is not 'test'. In order to circumvent the security
  measures you need a) to disable the authorization protection (i.e.
  bypass it without requiring the credentials); and b) retrieve the
  encryption key used by the encryption program.
       
  Upon receiving your distribution file, the undercover agent is instructed
  to perform a well-defined protocol:

    - decompress the distribution tarball and enter the project directory

      $ tar zxvf crypt.tar.gz
      $ cd crypt

    - build the software

      $ make

    - execute the software by evoking the program at a Unix-like terminal

      $ make run FILE=<encrypted-file> KEY=<decryption-key>

  At the root of the project directory tree you should have

  a) the binary and library files you were given access to;
  b) any other files you create, in source format;
  c) a Makefile script implementing the needed rules to build any object
     files from the source code, and to execute the program (as defined
     by the aforementioned protocol)
  d) A file named NOTES containing
     - your credentials (name, id);
     - an explanation of how you circumvented the access restriction;
     - a piece of technical advice on how 'docrypt' might be improved to avoid the
       security breach you have exploited.


  The following workflow has been suggested.

  1) Inspect the artifacts.

     Identify the characteristics of the target runtime and inspect
     software artifacts.

     You may find it useful to experiment with the GNU utilities to inspect and
     debug binaries such as readelf, objdump, gdb and other.


  2) Execute the program.

     Execution should be prevented by the protection mechanism.

  3) Circumvent the access restriction.

     Recall that no piece of software should be modified so as not to
     violate the hash-check execution protection. The protection
     should be circumvented non-invasively from outside the object files.

  4) Decrypt the sample file.

     The authorization key allows you to execute the software.
     The file, though, is encrypted with another key.
     You need to retrieve the encryption key from the binaries
     and use it in the 'run' rule of your Makefile.

  5) Prepare your deliverables

     Check if the files pass the hash-check.
     Check if your Makefile is compliant with the usage protocol.
     Check if all the files are in the directory.

  6) Deliver the files.
  

  Ethan, good luck.



