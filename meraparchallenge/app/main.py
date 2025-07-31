from fastapi import FastAPI, Request
from fastapi.responses import HTMLResponse
from fastapi.templating import Jinja2Templates
from pydantic import BaseModel
import os

app = FastAPI()
templates = Jinja2Templates(directory="app/templates")

# GET endpoint to render the HTML page with dynamic string
@app.get("/", response_class=HTMLResponse)
def read_root(request: Request):
    message_file = os.path.join(os.path.dirname(__file__), "message.txt")
    try:
        with open(message_file, "r") as f:
            dynamic_string = f.read().strip()
    except FileNotFoundError:
        dynamic_string = "No message set"
    return templates.TemplateResponse("index.html", {"request": request, "message": dynamic_string})

# Define the data model for incoming JSON payload
class Message(BaseModel):
    new_string: str

# POST endpoint to update the dynamic string
@app.post("/update")
def update_message(msg: Message):
    message_file = os.path.join(os.path.dirname(__file__), "message.txt")
    with open(message_file, "w") as f:
        f.write(msg.new_string)
    return {"message": "Message updated successfully"}
