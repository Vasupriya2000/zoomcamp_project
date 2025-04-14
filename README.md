

# **Amazon Book Reviews Data Engineering Project**

## **Project Summary:**

This project focuses on building an automated **ETL pipeline** to process and analyze over **3 million Amazon book reviews**, covering **212,404 unique books**. The goal is to transform raw review data into actionable insights that highlight:

* The **top-rated books** as reviewed by readers.

* The **most frequently recommended** or suggested books.

* How **book publishing** and **reviewing patterns** have evolved 

By leveraging a modern data stack—

**Docker** for containerization,

**Terraform** for infrastructure provisioning,

**Kestra** for orchestration (Batch processing)

, Data loaded to **Google data lake ,

Bigquery** for Datawarehousing ,**data partitioned and clustered**, 

**dbt** for transformation, and 

**Looker Studio** for visualization

the project ensures a scalable and reproducible pipeline from data ingestion to dashboarding.

**Data Visualizations:**
![vis1](https://github.com/user-attachments/assets/3b51b131-116c-4f69-ad2c-802ddddcc3e8)
![vis2](https://github.com/user-attachments/assets/3731dbf1-1556-49d4-a408-61380375dc37)
![vis3](https://github.com/user-attachments/assets/7f447eb5-a4ae-4c04-b554-1351e1c27240)
![vis4](https://github.com/user-attachments/assets/e5c4851a-d6d6-4d21-8bf5-14a74b73de65)



## **Problem Description**

With the explosive growth of online reviews, platforms like Amazon have become treasure troves of consumer feedback. The **Amazon Book Reviews dataset**,  offers deep insight into how readers engage with books over nearly three decades.

But with **millions of reviews** and **thousands of authors**, key questions emerge:

*  **Which books truly stand the test of time?**

*  **Which authors consistently earn high praise?**

*  **How have reader interests and sentiments shifted over the years?**

*  **Are certain genres or topics trending more than others?**

Ultimately, this project turns messy review data into **actionable insights** about the literary world—who’s writing, who’s reading, and how those relationships have evolved over nearly 30 years.

##  **Dataset:**

[https://www.kaggle.com/datasets/mohamedbakhet/amazon-books-reviews](https://www.kaggle.com/datasets/mohamedbakhet/amazon-books-reviews)

The dataset contains feedback about 3 million users on 212404 unique books .This contains product reviews and metadata from Amazon.
## **Technologies used:**

* GCP VM Instance (Processing)  
* Terraform (Infrastructure as a Service)  
* Kestra (Data Pipeline for ingestion  \- ETL)  
* GCP Storage Bucket (Data Lake)  
* Big Query (Data Warehouse)  
* DBT (Creating Analytical Views)  
* Google Data Studio (Dashboard)

**Architecture Diagram:**

![1](https://github.com/user-attachments/assets/cd36d245-9d4d-442b-9e12-53c43fad3378)

**Steps to reproduce:**

### **Local setup**

* Install the below tools:  
  * [Terraform](https://www.terraform.io/downloads)  
  * [Google Cloud SDK](https://cloud.google.com/sdk/docs/install-sdk#deb)  
  * docker \+ docker-compose

### **Cloud setup**

* In GCP, create a service principal with the following permissions:  
  * BigQuery Admin  
  * Storage Admin  
  * Storage Object Admin  
  * Dataproc Admin  
* Download the service principal authentication file and save it as $HOME/.google/credentials/google\_credentials\_project.json.

### **Data Ingestion**

* Setup kestra to perform data ingestion with the docker-compose file .It also has pgadmin,postgres in the container that I have created.  
* Create a google VM, and set up the private and public keys to remotely connect to the instance.  
* After cloning the repo from "(https://github.com/Vasupriya2000/zoomcamp_project.git)", sftp the top level folder and its contents into the instance.  
* Go to de-zoomcamp-final-project and update the values shown below in the docker-compose file to match your environment

![2](https://github.com/user-attachments/assets/8f466a18-6f69-449e-985b-aac7878738b5)


* Go to the kestra UI at the web address localhost:8080   
* Use the kestra flows to ingest the data, upload it to the data lake and ingest it to the data warehouse staging tables.

### **Initializing Infrastructure (Terraform)**

* Perform the following to set up the required cloud infrastructure
  ![3](https://github.com/user-attachments/assets/f241697d-c9bf-42e6-a74b-08a3cc02763a)


This will create the necessary gcs and bigquery instances.

![4](https://github.com/user-attachments/assets/9560dcdd-4026-400b-aca1-3083d066dbfd)

![5](https://github.com/user-attachments/assets/23ab99d4-0cb4-4d12-88d2-f1a05c6d6370)


### **Data Transformation**

* Go to ([https://github.com/dnagarajan807/final\_project\_dbt.git](https://github.com/dnagarajan807/final_project_dbt.git)) and fork the repository.  
* Create your project in cloud.getdbt.com, connect to your repository and to your bigquery connection.  
* Run the below code

![6](https://github.com/user-attachments/assets/c381c20a-4495-4f64-b4c4-4be17d7aaf03)


* The transformed data and models will be saved as a Bigquery tables.

![7](https://github.com/user-attachments/assets/4507a304-2eb6-4a77-9a7b-caa2d17e92e1)

![8](https://github.com/user-attachments/assets/2f135891-30fc-4e78-a2e8-31e795efbb62)

The below is the scheduled job to load data in production on a daily basis
![9](https://github.com/user-attachments/assets/e65d2fee-b26b-4896-b903-70c46dbf4525)

![10](https://github.com/user-attachments/assets/7a7c3a01-77ff-45c0-9920-2a40d43edf5a)

Book\_analysis table is loaded in production with a scheduled job.



