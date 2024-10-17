-- script that creates a stored procedure AddBonus that adds a new correction for a student.

DELIMITER $$

CREATE PROCEDURE AddBonus (
    IN user_id INT,
    IN project_name VARCHAR(255),
    IN score INT
)
BEGIN
    DECLARE project_id INT;

    -- Check if the project exists, and get the project_id
    SELECT id INTO project_id
    FROM projects
    WHERE name = project_name
    LIMIT 1;

    -- If the project does not exist, create it
    IF project_id IS NULL THEN
        INSERT INTO projects (name) VALUES (project_name);
        SET project_id = LAST_INSERT_ID(); -- Get the new project's id
    END IF;

    -- Insert a new correction record
    INSERT INTO corrections (user_id, project_id, score)
    VALUES (user_id, project_id, score);

END $$

DELIMITER ;
