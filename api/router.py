from fastapi import FastAPI, HTTPException
from models import Book  # Import the Book model

app = FastAPI()

@app.get("/api/v1/books/{book_id}")
async def get_book(book_id: int):
    book = await Book.get_or_none(id=book_id)  # Fetch book from the database
    if not book:
        raise HTTPException(status_code=404, detail="Book not found")
    return book
