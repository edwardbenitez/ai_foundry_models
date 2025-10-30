
from openai import OpenAI
from azure.identity import DefaultAzureCredential, get_bearer_token_provider
import os
from dotenv import load_dotenv
import logging

# Set up logging
logger = logging.getLogger(__name__)
console_handler = logging.StreamHandler()
logger.addHandler(console_handler)
logger.setLevel(logging.INFO)

def main():
    load_dotenv()
    logger.info("Environment variables loaded.")
    ENDPOINT = os.getenv("endpoint")
    MODEL_NAME = os.getenv("model_name")
    logger.info(f"Using endpoint: {ENDPOINT}")
    logger.info(f"Using model: {MODEL_NAME}")
    token_provider = get_bearer_token_provider(
        DefaultAzureCredential(), "https://cognitiveservices.azure.com/.default"
    )

    client = OpenAI(  
    base_url = f"{ENDPOINT}/openai/v1/",  
    api_key=token_provider,
    )

    response = client.responses.create(
        model=MODEL_NAME,
        reasoning={"effort": "minimal"},
        input= "what are you?"
    )

    print(response.model_dump_json(indent=2))

if __name__ == "__main__":
    main()