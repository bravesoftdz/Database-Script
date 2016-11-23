USE lands;
DELIMITER $$
DROP PROCEDURE IF EXISTS lands.dsp_Find_Adventure $$
CREATE DEFINER=`lands_game`@`%` PROCEDURE lands.`dsp_Find_Adventure` (RealmID int )
BEGIN

	DROP TABLE IF EXISTS tmp_skatt;
    CREATE TEMPORARY TABLE tmp_skatt
	(
		randomid INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
        `id` int(11) NOT NULL,
        `Realm` mediumtext
    );
    
    
    INSERT INTO tmp_skatt(id, Realm)
    SELECT 
            id,
			Realm
    FROM 
         	lands.tbl_Published_Realm
    WHERE 
			Deleted = 0
	AND
			RoomCount > 2;
    
    SELECT 
            id,
			Realm
    FROM 
            tmp_skatt
    WHERE 
            randomid  = RealmID;
	
    DROP TABLE tmp_skatt;

END$$

DELIMITER ;
