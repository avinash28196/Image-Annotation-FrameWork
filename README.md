# Automatic Image Annotation FrameWork
In the recent years Image Annotation has picked up a significance in the process of searching, retrieving and applying labels for images.The project involves in identifying and recognizing the objects within the given image using predefined neural network learning algorithms and tools. The model also includes recognition of complex images using partially annotated datasets for improved annotation process. 

The model accomplishes two major tasks: Initially, to explain with labels and later to segment the picture with the comparable area, such that the expectation of the overall model will be useful in computer vision. The proposed model is carried out using MatLab and ImageNet dataset. The performance of the system demonstrates the presence of correct- ness within the inputted image using labels (tags) and partitioning pictures from different classes portraying to various scenes.

## Motivation

With the development of the Internet and digital imaging devices many large im- age collections are being created. Popular online photo-sharing sites like Flickr contain hundreds of millions of diverse pictures. Many organizations, e.g. li- braries, hospitals, governments and commerce have also been creating their large image databases by scanning paintings, manuscripts, prints and drawings. Search- ing and finding large numbers of images from a database is a challenging problem. Search engine they do not really capture the semantics or meaning of images well. For image retrieval systems based on text queries, the key problem is how to get the metadata such as captions, titles or transcriptions. Manual annotation is not practical for large volumes of image sets. Commercial image search engines for the Internet, e.g. Google image and Yahoo image, use the text surrounding each image as its description. However, these search engines entirely ignore the visual content of the images and the surrounding text doesnt always relate to the visual content of an image. The consequence is that the returned images may be entirely unrelated to users needs.

Vision is the richest sense that a human being has which computer does not have and will consist of a tedious process to achieve the same for a computer. Object recognition and classification play a major role in this field.So we need a framework which is used for detecting objects from the image and annotate them with the proper tags, which will be used for problems stated above.

## Scope

Image annotation is a complex job of detecting objects and classifying each ob- jects in a given image. Even though the process is extremely useful in some cases, the complexity of the process limits many novice developers from using image annotation and object detection in their projects. So we are developing a user friendly framework that will do simplest of the image annotation tasks and help novice developers in their projects that might need object detection and classification.

## Proposed Model

Here we have used MatLab Computer Vision toolbox which is efficient and faster than OpenCV. Objective is, we are trying to extract feature from an image and annotate them with appropriate tags for the object present in them. We extracted features and classify the image using [AlexNet](https://es.mathworks.com/matlabcentral/fileexchange/59133-deep-learning-toolbox-model-for-alexnet-network) ( A pre-trained convolutional Neural Network) which uses SIFT(Scale-invariant feature transform) which is advanced method than ORB and SURF, which helps in reducing noise. And also it uses dropout technique to selectively ignore single neurons during training avoiding the averaging effects of average pooling. Benefits of proposed work are:

1. Firstly, language selection is very important, MatLab is very efficient in terms of space and time.
2. Secondly, we used AlexNet which is one of top most ImageNet Classification in the field of neural Network

![image](https://github.com/avinash28196/Image-Annotation-FrameWork/blob/master/ScreenShot/System%20Architecture.png)

### Processing of Image

![image](https://github.com/avinash28196/Image-Annotation-FrameWork/blob/master/ScreenShot/PreProcessing.png)

### Object detection 

![image](https://github.com/avinash28196/Image-Annotation-FrameWork/blob/master/ScreenShot/Object%20detection%20and%20segmentation.png)


## The Image Annotation FrameWork.

This area portrays the outcomes got after the execution of actualized re- enactment. The accompanying screen shots characterize the outcomes or yields that are got after orderly execution of all modules of the framework.
This Framework will ask the user to input a image from the folder to annotate the image either by selecting manual mode or Auto mode or user can detect the live object from the web cam feed.

![image](https://github.com/avinash28196/Image-Annotation-FrameWork/blob/master/ScreenShot/1.PNG)


The user interface in the below consists load image,which is used to load the image from the folder. Option for manual annotation,automatic annotation, and also live object detection using webcam.
User Can upload the image by clicking the load image button,and select option from below to annotate the image.


![image](https://github.com/avinash28196/Image-Annotation-FrameWork/blob/master/ScreenShot/2.jpg)

Annotation can be done in two ways either manually dragging box over the image to find the objects or click automatic button to auto annotate the image.

![image](https://github.com/avinash28196/Image-Annotation-FrameWork/blob/master/ScreenShot/3.jpg)

## Conclusion.

Here a novel framework is proposed for annotating the images using ImageNet as Dataset. For every image in the dataset, Annotations are produced and are displayed. When we input an image, it will be segmented to detect objects by Image Retrieval Algorithm Based on Convolutional Neural Network. And the input image is compared to correctness of the objects detected.The proposed method gives us a robust methodology for extracting different object of images at low time complexity.We have tested our result with other methods such ”Image Classification with Bag of Visual Words” which uses K means clustering technique to classify the image which takes lot of time and space. Our proposed method takes comparatively less time than the other method to detect an object in the image.This mechanism can be used for various purposes in the field of Object detection.

## Future Work

Future work to improve the accuracy of the system can take many directions. First, the incorporation of 3-D information in the learning process may improve the models, perhaps through learning via stereo images or 3-D images. Addition- ally, shape information can be utilized to improve the modeling process. Second, better and larger amounts of training images per semantic concept may produce more robust models. Contextual information may also help in the modeling and annotation process. Third, this method holds promise for various application do- mains, including bio-medicine. Finally, the system can be integrated with other retrieval methods to improve usability in the field of computer vision.

[PDF](https://github.com/avinash28196/Image-Annotation-FrameWork/blob/master/Image%20Annotation%20Framework%20Report.pdf)
