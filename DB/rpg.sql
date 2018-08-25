-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema rpg
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `rpg` ;

-- -----------------------------------------------------
-- Schema rpg
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `rpg` DEFAULT CHARACTER SET utf8 ;
USE `rpg` ;

-- -----------------------------------------------------
-- Table `rpg`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rpg` ;

CREATE TABLE IF NOT EXISTS `rpg` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  `description` VARCHAR(800) NOT NULL,
  `developer` VARCHAR(45) NOT NULL,
  `publisher` VARCHAR(45) NOT NULL,
  `release_year` INT UNSIGNED NOT NULL,
  `url_image` VARCHAR(100) NULL,
  `url_review` VARCHAR(100) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

SET SQL_MODE = '';
DROP USER IF EXISTS rpguser@localhost;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'rpguser'@'localhost' IDENTIFIED BY 'rpguser';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'rpguser'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `rpg`
-- -----------------------------------------------------
START TRANSACTION;
USE `rpg`;
INSERT INTO `rpg` (`id`, `title`, `description`, `developer`, `publisher`, `release_year`, `url_image`, `url_review`) VALUES (1, 'Diablo', 'Diablo is an action role-playing hack and slash video game. The player moves and interacts with the environment primarily by way of a mouse. Other actions, such as casting a spell, are performed in response to keyboard inputs. The player can acquire items, learn spells, defeat enemies, and interact with non-player characters (NPC)s throughout the game.', 'Blizzard North', 'Blizzard Entertainment', 1996, 'https://upload.wikimedia.org/wikipedia/en/3/3a/Diablo_Coverart.png', 'http://www.metacritic.com/game/pc/diablo');
INSERT INTO `rpg` (`id`, `title`, `description`, `developer`, `publisher`, `release_year`, `url_image`, `url_review`) VALUES (2, 'Diablo II', 'Diablo II\'s storyline progresses through four chapters or \"Acts\". Each act follows a predetermined path, but the wilderness areas and dungeons between key cities are randomly generated. The player progresses through the story by completing a series of quests within each act, while there are also optional side dungeons for extra monsters and experience.', 'Blizzard North', 'Blizzard Entertainment', 2000, 'https://upload.wikimedia.org/wikipedia/en/d/d5/Diablo_II_Coverart.png', 'http://www.metacritic.com/game/pc/diablo-ii');
INSERT INTO `rpg` (`id`, `title`, `description`, `developer`, `publisher`, `release_year`, `url_image`, `url_review`) VALUES (3, 'Baldur\'s Gate', 'Players conduct the game from a top-down isometric third-person perspective, creating a character for each playthrough who then travels across pre-rendered location, taking on quests, recruiting companions to aid them, and combating enemies, while working towards completing the game\'s main story. ', 'BioWare, Black Isle Studios', 'Interplay Entertainment', 1998, 'https://upload.wikimedia.org/wikipedia/en/d/d0/Baldur%27s_Gate_box.PNG', 'http://www.metacritic.com/game/pc/baldurs-gate');
INSERT INTO `rpg` (`id`, `title`, `description`, `developer`, `publisher`, `release_year`, `url_image`, `url_review`) VALUES (4, 'Baldur\'s Gate II: Shadows of Amn', 'Baldur\'s Gate II: Shadows of Amn is an Advanced Dungeons & Dragons 2nd edition computer role-playing game. The central quest of the game consists of about 50 to 60 hours of play, while the full game, including all side quests, is estimated to be between 200 and 300 hours. The player controls a party of up to six characters, one of whom is the protagonist; if the protagonist dies, a saved-game must be loaded, or a new game begun. ', 'BioWare', 'Interplay Entertainment, Black Isle Studios', 2000, 'https://upload.wikimedia.org/wikipedia/en/1/17/Baldur%27s_Gate_II_-_Shadows_of_Amn_Coverart.png', 'http://www.metacritic.com/game/pc/baldurs-gate-ii-shadows-of-amn');
INSERT INTO `rpg` (`id`, `title`, `description`, `developer`, `publisher`, `release_year`, `url_image`, `url_review`) VALUES (5, 'Icewind Dale', 'Icewind Dale\'s gameplay operates on a similar basis to that of Baldur\'s Gate, in that it incorporates a modified version of the Advanced Dungeons & Dragons 2nd edition ruleset, with the rules\' intricacies automatically computed; the game keeps track of statistics and controls dice rolling. It uses a similar user interface though with cosmetic changes, and focuses mainly on combat, often against large groups of enemies, with dialogue driving the main story.', 'Black Isle Studios', 'Interplay Entertainment', 2000, 'https://upload.wikimedia.org/wikipedia/en/3/38/Icewind_dale_1_box_shot.jpg', 'http://www.metacritic.com/game/pc/icewind-dale');
INSERT INTO `rpg` (`id`, `title`, `description`, `developer`, `publisher`, `release_year`, `url_image`, `url_review`) VALUES (6, 'The Elder Scrolls III: Morrowind', 'The Elder Scrolls III: Morrowind is an open-world, fantasy, action role-playing video game developed by Bethesda Game Studios and published by Bethesda Softworks. It is the third installment in The Elder Scrolls series of games, following The Elder Scrolls II: Daggerfall, and preceding The Elder Scrolls IV: Oblivion.', 'Bethesda Game Studios', 'Bethesda Softworks', 2002, 'https://upload.wikimedia.org/wikipedia/en/5/53/MorrowindCOVER.jpg', 'http://www.metacritic.com/game/xbox/the-elder-scrolls-iii-morrowind');
INSERT INTO `rpg` (`id`, `title`, `description`, `developer`, `publisher`, `release_year`, `url_image`, `url_review`) VALUES (7, 'Arcanum: Of Steamworks and Magick Obscura', 'Gameplay in Arcanum consists of traveling through the game world, visiting locations and interacting with the local inhabitants, typically in real-time. Occasionally, inhabitants will require the player\'s assistance in various tasks, which the player may choose to solve in order to acquire special items, experience points, or new followers. Many quests offer multiple solutions for the player, depending on their playing style, which may consist of combat, persuasion, thievery, or bribery. Ultimately, players will encounter hostile opponents (if such encounters are not avoided using stealth or diplomacy), in which case they and the player will engage in combat, which can be real-time or turn-based.', 'Troika Games', 'Sierra On-Line', 2001, 'https://upload.wikimedia.org/wikipedia/en/5/57/Arcanum_cover_copy.jpg', 'http://www.metacritic.com/game/pc/arcanum-of-steamworks-and-magick-obscura');
INSERT INTO `rpg` (`id`, `title`, `description`, `developer`, `publisher`, `release_year`, `url_image`, `url_review`) VALUES (8, 'Fallout 3', 'Fallout 3 is a post-apocalyptic action role-playing open world video game developed by Bethesda Game Studios and published by Bethesda Softworks. The third major installment in the Fallout series, it is the first game to be created by Bethesda since it bought the franchise from Interplay Entertainment. The game marks a major shift in the series by using 3D graphics and real-time combat, replacing the 2D isometric graphics and turn-based combat of previous installments. ', 'Bethesda Game Studios', 'Bethesda Softworks', 2008, 'https://upload.wikimedia.org/wikipedia/en/8/83/Fallout_3_cover_art.PNG', 'http://www.metacritic.com/game/pc/fallout-3');
INSERT INTO `rpg` (`id`, `title`, `description`, `developer`, `publisher`, `release_year`, `url_image`, `url_review`) VALUES (9, 'Icewind Dale II', 'Icewind Dale II is a role-playing video game developed by Black Isle Studios and published by Interplay Entertainment, released on August 27, 2002. Like its 2000 predecessor Icewind Dale, the game is set in the Forgotten Realms fantasy setting in the Icewind Dale region. The player assumes control of a group of mercenaries in a war between the Ten Towns of Icewind Dale and a coalition of persecuted races and religions.', 'Black Isle Studios', 'Interplay Entertainment', 2002, 'https://upload.wikimedia.org/wikipedia/en/c/cd/Icewind_dale_II_box_shot_211.jpg', 'http://www.metacritic.com/game/pc/icewind-dale-ii');
INSERT INTO `rpg` (`id`, `title`, `description`, `developer`, `publisher`, `release_year`, `url_image`, `url_review`) VALUES (10, 'Chrono Trigger', 'Chrono Trigger features standard role-playing video game gameplay. The player controls the protagonist and his companions in the game\'s two-dimensional fictional world, consisting of various forests, cities, and dungeons. Navigation occurs via an overworld map, depicting the landscape from a scaled-down overhead view. Areas such as forests, cities, and similar places are depicted as more realistic scaled-down maps, in which players can converse with locals to procure items and services, solve puzzles and challenges, or encounter enemies.', 'Square', 'Square, Square Enix', 1995, 'https://upload.wikimedia.org/wikipedia/en/a/a7/Chrono_Trigger.jpg', 'http://www.metacritic.com/game/ds/chrono-trigger');
INSERT INTO `rpg` (`id`, `title`, `description`, `developer`, `publisher`, `release_year`, `url_image`, `url_review`) VALUES (11, 'Diablo II: Lord of Destruction', 'Diablo II: Lord of Destruction is an expansion pack for the hack and slash action role-playing game Diablo II. Unlike the original Diablo\'s expansion pack, Diablo: Hellfire, it is a first-party expansion developed by Blizzard North.', 'Blizzard North', 'Blizzard Entertainment', 2001, 'https://upload.wikimedia.org/wikipedia/en/3/31/Diablo_II_-_Lord_of_Destruction_Coverart.png', 'http://www.metacritic.com/game/pc/diablo-ii-lord-of-destruction');

COMMIT;

