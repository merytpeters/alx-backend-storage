-- Create a store procedure ComputeAverageScoreForUser

DELIMITER //

CREATE PROCEDURE ComputeAverageScoreForUser(IN user_id INT) 
BEGIN
    -- Declare a variable to store the average score
    DECLARE avg_score DECIMAL(5, 2);

    -- Calculate the average score from the 'corrections' table
    SELECT AVG(score) INTO avg_score
    FROM corrections
    WHERE user_id = user_id;

    -- Update the 'users' table to store the calculated average score
    UPDATE users
    SET average_score = avg_score
    WHERE id = user_id;
END;
//

DELIMITER ;
