CREATE TABLE comment (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    review_id INTEGER NOT NULL,
    member_id INTEGER NOT NULL,
    parent_comment_id INTEGER,
    comment_text TEXT NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_comment_review
        FOREIGN KEY (review_id)
        REFERENCES review(id),

    CONSTRAINT fk_comment_member
        FOREIGN KEY (member_id)
        REFERENCES member(id),

    CONSTRAINT fk_comment_parent
        FOREIGN KEY (parent_comment_id)
        REFERENCES comment(id),

    CONSTRAINT chk_comment_text
        CHECK (LENGTH(TRIM(comment_text)) > 0)
);