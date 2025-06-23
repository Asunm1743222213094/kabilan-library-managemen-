-- Create Library Schema
CREATE SCHEMA Library;
SET search_path TO Library;

-- Author Table
CREATE TABLE Author (
    AuthorID SERIAL PRIMARY KEY,
    Name VARCHAR(100) NOT NULL
);

-- Publisher Table
CREATE TABLE Publisher (
    PublisherID SERIAL PRIMARY KEY,
    Name VARCHAR(100) NOT NULL
);

-- Category Table
CREATE TABLE Category (
    CategoryID SERIAL PRIMARY KEY,
    CategoryName VARCHAR(50) NOT NULL
);

-- Book Table
CREATE TABLE Book (
    BookID SERIAL PRIMARY KEY,
    Title VARCHAR(200) NOT NULL,
    ISBN VARCHAR(20) UNIQUE,
    PublisherID INT REFERENCES Publisher(PublisherID),
    CategoryID INT REFERENCES Category(CategoryID),
    PublicationYear INT
);

-- BookAuthor (Many-to-Many relationship)
CREATE TABLE BookAuthor (
    BookID INT REFERENCES Book(BookID),
    AuthorID INT REFERENCES Author(AuthorID),
    PRIMARY KEY (BookID, AuthorID)
);

-- Member Table
CREATE TABLE Member (
    MemberID SERIAL PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100) UNIQUE,
    Phone VARCHAR(15),
    JoinDate DATE DEFAULT CURRENT_DATE
);

-- Librarian Table
CREATE TABLE Librarian (
    LibrarianID SERIAL PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100)
);

-- Loan Table
CREATE TABLE Loan (
    LoanID SERIAL PRIMARY KEY,
    BookID INT REFERENCES Book(BookID),
    MemberID INT REFERENCES Member(MemberID),
    LibrarianID INT REFERENCES Librarian(LibrarianID),
    LoanDate DATE DEFAULT CURRENT_DATE,
    ReturnDate DATE
);
