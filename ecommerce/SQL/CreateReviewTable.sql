CREATE TABLE review (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    member_id INTEGER NOT NULL,
    product_id INTEGER NOT NULL,
    rating INTEGER NOT NULL,
    review_text TEXT NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_review_member
        FOREIGN KEY (member_id)
        REFERENCES member(id),

    CONSTRAINT fk_review_product
        FOREIGN KEY (product_id)
        REFERENCES product(id),

    CONSTRAINT chk_review_rating
        CHECK (rating BETWEEN 1 AND 5),

    CONSTRAINT chk_review_text
        CHECK (LENGTH(TRIM(review_text)) > 0)
);