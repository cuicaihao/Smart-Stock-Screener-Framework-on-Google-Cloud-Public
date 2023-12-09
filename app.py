# Cloud RUN with Cloud Scheduler to run the job weekly:
# download the stock list data from the server and save it to a cloud storage bucket, and create a table in BigQuery.

# %% [markdown]
# Steps breakdown:
#
# 1. get the token from the secret manager
# 2. use the token to concent to the server and get the stock list data into a pandas dataframe
# 3. save the dataframe to a csv file in a cloud storage bucket
# 4. write dataframe into the BigQuery table
# 5. get all the stock weekly data
# 6. write the dataframe to a csv file in a cloud storage bucket
# 7. apply the stock screener job
 