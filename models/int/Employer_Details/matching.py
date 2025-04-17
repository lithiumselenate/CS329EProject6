import pandas as pd
import os
import json
from google.oauth2 import service_account
#import json
#import vertexai
#from vertexai.generative_models import GenerativeModel
service_account_info = {
  "type": "service_account",
  "project_id": "silken-fortress-448205-p9",
  "private_key_id": "71d77d1a2073bafb0db6992cdad7614a88a21bdc",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQClBzwnVW9yrimb\npB0X8ELIvXkaJfNWlUJM8HB+JvUhPcyKH1/vnTlAm+kJkbvNr4xQBCFdDkJri+2y\nIEdCCaPN7eUxrL5E5zYE5SXlMqw5eAj7Xlngb2s3CdlBfuM/oN2Rro4AhrKGpLlG\n8GjxNRUxwFoXulIJ4jxIfuWLyUgTFS6t+2I8BaMtpP31XzV4tKU/mwfLVAwMwrUT\nuWgVyC+nJico3h0Ymr7YkEMqjnVTmgzupnssRTyCSmnnXwTrwzOig5Z0pRIIVtGD\nOnpfuTSdPFip/e74BqCoysTXe8HaUfamp6Rbm4o67GgZVzhN2AwNimIA7jnIaLvq\nkrh+Gp/TAgMBAAECggEADKJwqwxB85Q88EMQzSfiXQ8Qif1002CrCkvwOOBPrSNX\nmQ2M4UH2w6kMHuTu7XDuu6ONUFwKnsRARv5spjQpu9bmULbKfGj9PEO08oa+I8o6\nWdBf7ixpl3WkEf0edd0hiYlFKuolGeTboIBAcJMhU8VHwIBNzp7pAZ3hgiG/aGJ7\nxIOigdLUyNR6D/piKok/EFiuAQx5biZ7OdwdV0+SYo1deiV5urH9/SXE4wxAPlIJ\nGz21qdicyDmC4zEeVDhHqDU6dLP+UW3TYEDB1VwIRRwxHPh7eQGTiiM9Pmb74U7B\n2kPDN1mWQT5eq4+nMRl/HeXz4JZ4yGFwbaxgFDHTRQKBgQDYOXqMqG6SdkypEMH8\new4Ibo8jaXHkcXk5MfHCIzPXxMdvbXlFr31H5ulSzt4D7nIW/eNdSqSSxax4ZI4q\nzc/QZVpHKR5SUuV5xyL+fAorvwQVEoy7WscXIxE+JLaCpUYWCUHHe6M3VC0vG8eF\nqDTLa+olP00G/ZC3vB/X8OpztwKBgQDDYs3GBGGW3moEGlesTagp4tcrSl0Xh0qJ\nQfag84ceZvzH1CRHub4/zuSy1e31vbcN1HRlQeqcrwE5sinVEvm/AGaT/7YLbbME\naajqhf1fFkTNzOHcHPPLJoevLTXWNzu6MdA3yhD8wqSYBXqJW5iT9GeW6L7MJRBa\njhKp09UMxQKBgQCJY2xU96jac0SeoEFCVkZCYU2eKJ/vkZJ/HxcITingze4TBTJr\nbuhhyX0z2rIDOX1Q0p2nZ4hOoj/Gd85FsGR9fAjy8lOL55Rb3oaDwPkNdt/3K8Q0\nP6gFMYkBPX6iYLW5xsP/JrY8r8XOCw6qBIkXQEiUxjYBXRiZRnXNVg0C3QKBgQC3\nbYytN/O+RXPWAj0Iv6b+G73RIHEg45xwG4NEOxxAyILLvzeINrKLCNrfocNSjxbJ\nXwke/rEZA5rs5XwsUzIvxFqI2um29Pe5TtCLy9rAaBGT+6KWmH+v2q5LIPCH+TaT\naKyHk6Y7BSisp4gQZ/NoA2002bA1yx39RZ/z27EJ2QKBgBVqwuio4R70L6g3bP6u\n+/R25uFNFJs4xRYa2Vz7smLrcqnhu58CdO+Z3eq6Hg4Y/z9PCXN+3J6yOu+RfkuS\nKqLAPjAvh25G8WRlKNFnSSggiaWcpJkfNW7VY56qMjWGCjrGWxt0n5OBUKCHYNYO\n0ZkQ9KkdQESzZ33WkYGKGoN3\n-----END PRIVATE KEY-----\n",
  "client_email": "auth1-970@silken-fortress-448205-p9.iam.gserviceaccount.com",
  "client_id": "106644715728790824750",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/auth1-970%40silken-fortress-448205-p9.iam.gserviceaccount.com",
  "universe_domain": "googleapis.com"
}
credentials = service_account.Credentials.from_service_account_info(service_account_info)
def model(dbt, session):
    table = dbt.ref("temp_employer_details")
    '''
    df = table.filter(table["tax_id"].isNotNull())
    result = []
    for tax_id, group in df.groupby('tax_id'):
        original_names = group['original_name'].dropna().unique().tolist()
        unique_candidates = group.drop_duplicates(subset=['candidate_company_names', 'candidate_fein'])
        candidate_name_fein = [
            {row['candidate_company_names']: row['candidate_fein']}
            for _, row in unique_candidates.iterrows()
            if pd.notna(row['candidate_company_names']) and pd.notna(row['candidate_fein'])
        ]

        result.append({
            "tax_id": tax_id,
            "original_names": original_names,
            "candidate_name_fein": candidate_name_fein
        })

    json_result = json.dumps(result, indent=4, ensure_ascii=False)
    region = "us-central1"
    model_name = "gemini-2.0-flash-001"
    vertexai.init(project=project_id, location=region)
    model = GenerativeModel(model_name)
    data = json_result

    # Prepare Prompt
    prompt = """Here is a list of company names and candidate company names with FEINs.
    Match each original name to the most appropriate candidate based on similarity.
    Return a JSON object per line with the following fields:
    - tax_id
    - original_name
    - matched_candidate_name
    - matched_fein
    Return only one match per original_name. If no match is found, return null for matched_candidate_name and matched_fein.
    Do not return explanations.
    """

    # Set batch size
    batch_size = 5  

    # Prepare Batches
    records = []
    record_counter = 0
    batches = []
    for entry in data:
        tax_id = entry.get("tax_id", "Unknown")
        original_names = entry.get("original_names", [])
        candidate_name_fein = entry.get("candidate_name_fein", [])

        for original_name in original_names:
            candidate_str = "\n".join([f"{list(c.keys())[0]}: {list(c.values())[0]}" for c in candidate_name_fein])
            record = f"tax_id: {tax_id}\noriginal_name: {original_name}\ncandidates:\n{candidate_str}"
            records.append(record)
            record_counter += 1

            if record_counter == batch_size:
                batches.append("\n---\n".join(records))
                records = []
                record_counter = 0

    if records:
        batches.append("\n---\n".join(records))

    print(f"{len(batches)} total batches will be sent to Gemini.")

    # Function to send batch to Gemini with retry on API limit
    def send_batch_to_gemini(batch_data):
        max_retries = 5
        wait_time = 5  

        for attempt in range(max_retries):
            try:
                resp = model.generate_content([batch_data, prompt])
                resp_text = resp.text.replace("```json", "").replace("```", "")
                json_lines = resp_text.strip().split("\n")
                results = []
                for line in json_lines:
                    if line:
                        try:
                            results.append(json.loads(line))
                        except Exception as e:
                            print(f"Error converting line to JSON: {line}, Error: {e}")
                return results  
            except Exception as e:
                if "Resource exhausted" in str(e):  
                    print(f"API Limit Exceeded. Waiting {wait_time} seconds before retrying. Attempt {attempt+1} of {max_retries}.")
                    time.sleep(wait_time)  
                    wait_time *= 2  
                else:
                    print(f"API Error: {e}")
                    return []  

        print("Max retries reached. Skipping batch.")
        return []  

    # Process all batches with retry mechanism
    all_results = []
    for i, batch in enumerate(batches):
        print(f"Processing batch {i + 1} of {len(batches)}.")
        batch_results = send_batch_to_gemini(batch)
        all_results.extend(batch_results)
        time.sleep(1)  

    # Convert to DataFrame
    df_final = pd.DataFrame(all_results)

    # Remove duplicates
    df_final.drop_duplicates(subset=["tax_id", "original_name", "matched_candidate_name", "matched_fein"], inplace=True)
    matching = df_final

    '''
    
    matching = session.read_csv("gs://cs329e-h1b-project/matched_results_full.csv")
    return matching
    