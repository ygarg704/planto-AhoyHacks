# Planto

Watch the video [here]()

For instructions on how to run the project locally, click [here](#Instructions-to-run-the-project-locally)

## Social Impact

Earlier, the agrarian specialists, or as we call them farmers, just had the information passed down to them from their ancestors that assisted them with managing the entire plant-related illnesses. However restricted, farmers or agrarian specialists had the option to move gradually up through the different seasons and unforgiving and conflicting weather patterns.

All plant species, be it crops or the normally developing fauna, are presented to or are inclined to infections. These infections can prompt dry season, starvation, or a general abatement in the result of yields that can both, straightforwardly and in a roundabout way, influence individuals depending on them for their endurance. In this study, we were able to incorporate the use of technologies like deep learning to create a tool that can help aid in the detection of plant diseases as well as the remedy phase.
 
This project has been developed for the agricultural sector. Everywhere, agricultural practitioners, or as some call them farmers are at major stakes and about 45% of the population of the world is involved in the said sector. Having such an enormous impact on the world, more consideration ought to be paid to this present area's turn of events and development.

## Introduction

The application not only detects the plant disease but also provides the user with information on how to fix the same. Along with these base functionalities the application offers more assistance to the user by giving a library of agricultural products like fertilizers and equipment that they can purchase from the marketplace tab built-in the application. These features can come in handy to the farmers who need immediate help and can help save their crops benefiting everyone that is connected in this world-wide food chain.

## Features

### 1. Plant Disease Prediction & Management

For plant disease prediction and classification, a convolution neural network (sequential model) was built using python. Next, we calculated our model accuracy and were able to achieve an accuracy of 98.75%. Then, we exported our deep learning model as a .tflite file from jupyter notebook and embedded it into the android application. 

Our app is user-friendly and has been built keeping in mind the difficulties that the farmers face and provides them the solution as well. Planto focuses on the condition (diseases they may carry) of leaves. It scans the leaves and informs the farmer about any discrepancy that may arise in a long run and help them save their plantation from getting destroyed. Our app also guides users and shows the remedies or methods that should be adopted in order to deal with the situation at hand. It also states the symptoms that help farmers to understand more about the problem and what all can be done to protect their plants. It gives them a heads up about it and highlights the precautionary steps that the farmer can consider to prevent the disease altogether. A user can also keep track of their prediction history using the plant disease prediction history screen.

### 2. Customer Marketplace

Once the customer gets informed about the said disease he/she can purchase the said fertilizer or other equipment needed for the proper treatment of the plant disease. A user has access to all the goods that a seller has listed on his or her online store. You can see each product's description and add them to your cart and then place an order. There is also an order history screen where all the orders, that have been placed are shown.

### 3. Merchant's Panel

In the seller category, any person (manufacturer or merchant) who wishes to sell their agricultural material can add any equipment/fertilizers which they want to sell. All the data is stored in the firebase firestore storage and then displayed in the marketplace screen which is only visible to the customers who want to buy them. The seller can also edit or delete his/her marketplace according to their needs.

## Future Work

:soon: Implementing a multilingual chatbot for farmers to interact and discuss their problems with.

:soon: Developing awareness articles that cover agricultural topics like, discussing the condition of the soil, before the plantation takes place and how to maximize the field output etc.

:soon: Provide a calendar inside our application that would provide farmers and other agricultural practitioners with a timeline and best practices for farming.

:soon: To make the research results more prominent, we plan to extend our project by adding more data to our deep learning model. Also, there are other factors that play a vital role for yield of crops, like weather data, quality of soil and many more. We plant to focus on them as well.

## Tech Stack

:octocat: Database: [Firebase](https://firebase.google.com/)

:octocat: Deep Learning Model: [Python](https://www.python.org/)

:octocat: Android Application: [Flutter](https://flutter.dev/)

:octocat: Prototype & UI/UX: [Adobe XD and Illustrator](https://www.adobe.com/in/products/xd.html)

:octocat: Weather Widget: [OpenWeather API](https://openweathermap.org/)

## Requirements

### Hardware

1. macOS, Windows or Linux
2. At least 8GB of RAM recommended

### Software (for development)

1. A code editor (VS Code or Android Studio preferred)

### Software (for testing)

1. Android 5.0 or higher (minimum API Level 21 recommended)

## Instructions to run the project locally

1. Clone the repository and go to the root folder of the project, named `planto` in any editor (VS Code preferred).
2. Inside the root folder, open `pubspec.yaml` file and in the terminal run the command `flutter pub get`.
3. Once the command has been execued, go in the folder named `lib` and open the file named `main.dart`.
4. After opening the file, run the command `flutter run` in the terminal to start the android application.

Note: For testing the application, some images are stored in `test_images` folder. Download those images to test out the application.


💻 Made by - Aditya Chaudhary | Arpit Masih | Yash Garg
