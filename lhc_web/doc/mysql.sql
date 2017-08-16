
CREATE TABLE IF NOT EXISTS `lh_chat` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`nick` varchar(50) NOT NULL,
	`status` int(11) NOT NULL DEFAULT '0',
	`status_sub` int(11) NOT NULL DEFAULT '0',
	`status_sub_sub` int(11) NOT NULL DEFAULT '0',
	`time` int(11) NOT NULL,
	`user_id` int(11) NOT NULL,
	`hash` varchar(40) NOT NULL,
	`referrer` text NOT NULL,
	`session_referrer` text NOT NULL,
	`chat_variables` text NOT NULL,
	`remarks` text NOT NULL,
	`ip` varchar(100) NOT NULL,
	`dep_id` int(11) NOT NULL,
	`sender_user_id` int(11) NOT NULL,
	`product_id` int(11) NOT NULL,
	`usaccept` int(11) NOT NULL DEFAULT '0',
	`user_status` int(11) NOT NULL DEFAULT '0',
	`user_closed_ts` int(11) NOT NULL DEFAULT '0',
	`support_informed` int(11) NOT NULL DEFAULT '0',
	`unread_messages_informed` int(11) NOT NULL DEFAULT '0',
	`reinform_timeout` int(11) NOT NULL DEFAULT '0',
	`last_op_msg_time` int(11) NOT NULL DEFAULT '0',
	`has_unread_op_messages` int(11) NOT NULL DEFAULT '0',
	`unread_op_messages_informed` int(11) NOT NULL DEFAULT '0',
	`email` varchar(100) NOT NULL,
	`country_code` varchar(100) NOT NULL,
	`country_name` varchar(100) NOT NULL,
	`unanswered_chat` int(11) NOT NULL,
	`user_typing` int(11) NOT NULL,
	`user_typing_txt` varchar(50) NOT NULL,
	`operator_typing` int(11) NOT NULL,
	`operator_typing_id` int(11) NOT NULL,
	`phone` varchar(100) NOT NULL,
	`has_unread_messages` int(11) NOT NULL,
	`last_user_msg_time` int(11) NOT NULL,
	`fbst` tinyint(1) NOT NULL,
	`online_user_id` int(11) NOT NULL,
	`auto_responder_id` int(11) NOT NULL,
	`last_msg_id` int(11) NOT NULL,
	`lsync` int(11) NOT NULL,
	`additional_data` text NOT NULL,				  
	`user_tz_identifier` varchar(50) NOT NULL,
	`lat` varchar(10) NOT NULL,
	`lon` varchar(10) NOT NULL,
	`city` varchar(100) NOT NULL,
	`operation` text NOT NULL,
	`operation_admin` varchar(200) NOT NULL,
	`status_sub_arg` varchar(200) NOT NULL,
	`uagent` varchar(250) NOT NULL,
	`chat_locale` varchar(10) NOT NULL,
	`chat_locale_to` varchar(10) NOT NULL,
	`mail_send` int(11) NOT NULL,
	`screenshot_id` int(11) NOT NULL,
	`wait_time` int(11) NOT NULL,
	`chat_duration` int(11) NOT NULL,
	`tslasign` int(11) NOT NULL,
	`priority` int(11) NOT NULL,
	`chat_initiator` int(11) NOT NULL,
	`transfer_timeout_ts` int(11) NOT NULL,
	`transfer_timeout_ac` int(11) NOT NULL,
	`transfer_if_na` int(11) NOT NULL,
	`na_cb_executed` int(11) NOT NULL,
	`device_type` int(11) NOT NULL,
	`nc_cb_executed` tinyint(1) NOT NULL,
	PRIMARY KEY (`id`),
	KEY `status_user_id` (`status`,`user_id`),
	KEY `user_id_sender_user_id` (`user_id`, `sender_user_id`),
	KEY `unanswered_chat` (`unanswered_chat`),
	KEY `sender_user_id` (`sender_user_id`),
	KEY `online_user_id` (`online_user_id`),
	KEY `dep_id` (`dep_id`),
	KEY `product_id` (`product_id`),
	KEY `unread_operator` (`has_unread_op_messages`, `unread_op_messages_informed`),
	KEY `has_unread_messages_dep_id_id` (`has_unread_messages`,`dep_id`,`id`),
	KEY `status_dep_id_id` (`status`,`dep_id`,`id`),
	KEY `status_dep_id_priority_id` (`status`,`dep_id`,`priority`,`id`),
	KEY `status_priority_id` (`status`,`priority`,`id`)
	) DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `lh_chat_blocked_user` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`ip` varchar(100) NOT NULL,
	`user_id` int(11) NOT NULL,
	`datets` int(11) NOT NULL,
	PRIMARY KEY (`id`),
	KEY `ip` (`ip`)
	) DEFAULT CHARSET=utf8;

CREATE TABLE `lh_users_online_session` ( 
	`id` bigint(20) NOT NULL AUTO_INCREMENT, 
	`user_id` int(11) NOT NULL, 
	`time` int(11) NOT NULL, 
	`duration` int(11) NOT NULL, 
	`lactivity` int(11) NOT NULL, 
	PRIMARY KEY (`id`), 
	KEY `user_id_lactivity` (`user_id`, `lactivity`)) DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `lh_chat_archive_range` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`range_from` int(11) NOT NULL,
	`range_to` int(11) NOT NULL,
	PRIMARY KEY (`id`)
	) DEFAULT CHARSET=utf8;

CREATE TABLE `lh_abstract_auto_responder` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`siteaccess` varchar(3) NOT NULL,
	`wait_message` text NOT NULL,
	`wait_timeout` int(11) NOT NULL,
	`position` int(11) NOT NULL,
	`timeout_message` text NOT NULL,
	`dep_id` int(11) NOT NULL,
	`repeat_number` int(11) NOT NULL DEFAULT '1',
	`wait_timeout_2` int(11) NOT NULL,
	`timeout_message_2` text NOT NULL,
	`wait_timeout_3` int(11) NOT NULL,
	`timeout_message_3` text NOT NULL,
	`wait_timeout_4` int(11) NOT NULL,
	`timeout_message_4` text NOT NULL,
	`wait_timeout_5` int(11) NOT NULL,
	`timeout_message_5` text NOT NULL,
	`wait_timeout_reply_1` int(11) NOT NULL,
	`timeout_reply_message_1` text NOT NULL,
	`wait_timeout_reply_2` int(11) NOT NULL,
	`timeout_reply_message_2` text NOT NULL,
	`wait_timeout_reply_3` int(11) NOT NULL,
	`timeout_reply_message_3` text NOT NULL,
	`wait_timeout_reply_4` int(11) NOT NULL,
	`timeout_reply_message_4` text NOT NULL,
	`wait_timeout_reply_5` int(11) NOT NULL,
	`timeout_reply_message_5` text NOT NULL,
	`ignore_pa_chat` int(11) NOT NULL,
	PRIMARY KEY (`id`),
	KEY `siteaccess_position` (`siteaccess`,`position`)
	) DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `lh_abstract_widget_theme` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`name` varchar(250) NOT NULL,
	`name_company` varchar(250) NOT NULL,
	`onl_bcolor` varchar(10) NOT NULL,
	`bor_bcolor` varchar(10) NOT NULL DEFAULT 'e3e3e3',
	`text_color` varchar(10) NOT NULL,
	`online_image` varchar(250) NOT NULL,
	`online_image_path` varchar(250) NOT NULL,
	`offline_image` varchar(250) NOT NULL,
	`offline_image_path` varchar(250) NOT NULL,
	`logo_image` varchar(250) NOT NULL,
	`logo_image_path` varchar(250) NOT NULL,
	`need_help_image` varchar(250) NOT NULL,
	`header_background` varchar(10) NOT NULL,
	`need_help_tcolor` varchar(10) NOT NULL,
	`need_help_bcolor` varchar(10) NOT NULL,
	`need_help_border` varchar(10) NOT NULL,
	`need_help_close_bg` varchar(10) NOT NULL,
	`need_help_hover_bg` varchar(10) NOT NULL,
	`need_help_close_hover_bg` varchar(10) NOT NULL,
	`need_help_image_path` varchar(250) NOT NULL,
	`custom_status_css` text NOT NULL,
	`custom_container_css` text NOT NULL,
	`custom_widget_css` text NOT NULL,
	`custom_popup_css` text NOT NULL,
	`need_help_header` varchar(250) NOT NULL,
	`need_help_text` varchar(250) NOT NULL,
	`online_text` varchar(250) NOT NULL,
	`offline_text` varchar(250) NOT NULL,
	`widget_border_color` varchar(10) NOT NULL,
	`copyright_image` varchar(250) NOT NULL,
	`copyright_image_path` varchar(250) NOT NULL,
	`widget_copyright_url` varchar(250) NOT NULL,
	`show_copyright` int(11) NOT NULL DEFAULT '1',
	`explain_text` text NOT NULL,
	`intro_operator_text` varchar(250) NOT NULL,
	`operator_image` varchar(250) NOT NULL,
	`operator_image_path` varchar(250) NOT NULL,
	`minimize_image` varchar(250) NOT NULL,
	`minimize_image_path` varchar(250) NOT NULL,
	`restore_image` varchar(250) NOT NULL,
	`restore_image_path` varchar(250) NOT NULL,
	`close_image` varchar(250) NOT NULL,
	`close_image_path` varchar(250) NOT NULL,
	`popup_image` varchar(250) NOT NULL,
	`popup_image_path` varchar(250) NOT NULL,
	`support_joined` varchar(250) NOT NULL,
	`support_closed` varchar(250) NOT NULL,
	`pending_join` varchar(250) NOT NULL,
	`noonline_operators` varchar(250) NOT NULL,
	`noonline_operators_offline` varchar(250) NOT NULL,
	`hide_close` int(11) NOT NULL,
	`hide_popup` int(11) NOT NULL,
	`show_need_help` int(11) NOT NULL DEFAULT '1',
	`show_need_help_timeout` int(11) NOT NULL DEFAULT '24',
	`header_height` int(11) NOT NULL,
	`header_padding` int(11) NOT NULL,
	`widget_border_width` int(11) NOT NULL,
	`show_voting` tinyint(1) NOT NULL DEFAULT '1',
	`department_title` varchar(250) NOT NULL,
	`department_select` varchar(250) NOT NULL,
	`buble_visitor_background` varchar(250) NOT NULL,
	`buble_visitor_title_color` varchar(250) NOT NULL,
	`buble_visitor_text_color` varchar(250) NOT NULL,
	`buble_operator_background` varchar(250) NOT NULL,
	`buble_operator_title_color` varchar(250) NOT NULL,
	`buble_operator_text_color` varchar(250) NOT NULL,
	PRIMARY KEY (`id`)				
	) DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `lh_faq` (
				  `id` int(11) NOT NULL AUTO_INCREMENT,
				  `question` varchar(250) NOT NULL,
				  `answer` text NOT NULL,
				  `url` varchar(250) NOT NULL,
				  `email` varchar(50) NOT NULL,
				  `identifier` varchar(10) NOT NULL,
				  `active` int(11) NOT NULL,
				  `has_url` tinyint(1) NOT NULL,
				  `is_wildcard` tinyint(1) NOT NULL,
				  PRIMARY KEY (`id`),
				  KEY `active` (`active`),
				  KEY `active_url` (`active`,`url`),
				  KEY `has_url` (`has_url`),
				  KEY `identifier` (`identifier`),
				  KEY `is_wildcard` (`is_wildcard`)
				) DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `lh_cobrowse` (
        	   `id` int(11) NOT NULL AUTO_INCREMENT,
        	   `chat_id` int(11) NOT NULL,
        	   `online_user_id` int(11) NOT NULL,
        	   `mtime` int(11) NOT NULL,
        	   `url` varchar(250) NOT NULL,
        	   `initialize` longtext NOT NULL,
        	   `modifications` longtext NOT NULL,
        	   `finished` tinyint(1) NOT NULL,
        	   `w` int NOT NULL,
			   `wh` int NOT NULL,
			   `x` int NOT NULL,
			   `y` int NOT NULL,        	   		
        	   PRIMARY KEY (`id`),
        	   KEY `chat_id` (`chat_id`),
        	   KEY `online_user_id` (`online_user_id`)
        	   ) DEFAULT CHARSET=utf8;
        	           	   
CREATE TABLE `lh_abstract_survey` (
        	      `id` int(11) NOT NULL AUTO_INCREMENT,
                  `name` varchar(250) NOT NULL,
                  `feedback_text` text NOT NULL,
                  `max_stars_1_title` varchar(250) NOT NULL,
                  `max_stars_1_pos` int(11) NOT NULL,
                  `max_stars_2_title` varchar(250) NOT NULL,
                  `max_stars_2_pos` int(11) NOT NULL,
                  `max_stars_2` int(11) NOT NULL,
                  `max_stars_3_title` varchar(250) NOT NULL,
                  `max_stars_3_pos` int(11) NOT NULL,
                  `max_stars_3` int(11) NOT NULL,
                  `max_stars_4_title` varchar(250) NOT NULL,
                  `max_stars_4_pos` int(11) NOT NULL,
                  `max_stars_4` int(11) NOT NULL,
                  `max_stars_5_title` varchar(250) NOT NULL,
                  `max_stars_5_pos` int(11) NOT NULL,
                  `max_stars_5` int(11) NOT NULL,
                  `question_options_1` varchar(250) NOT NULL,
                  `question_options_1_items` text NOT NULL,
                  `question_options_1_pos` int(11) NOT NULL,
                  `question_options_2` varchar(250) NOT NULL,
                  `question_options_2_items` text NOT NULL,
                  `question_options_2_pos` int(11) NOT NULL,
                  `question_options_3` varchar(250) NOT NULL,
                  `question_options_3_items` text NOT NULL,
                  `question_options_3_pos` int(11) NOT NULL,
                  `question_options_4` varchar(250) NOT NULL,
                  `question_options_4_items` text NOT NULL,
                  `question_options_4_pos` int(11) NOT NULL,
                  `question_options_5` varchar(250) NOT NULL,
                  `question_options_5_items` text NOT NULL,
                  `question_options_5_pos` int(11) NOT NULL,
                  `question_plain_1` text NOT NULL,
                  `question_plain_1_pos` int(11) NOT NULL,
                  `question_plain_2` text NOT NULL,
                  `question_plain_2_pos` int(11) NOT NULL,
                  `question_plain_3` text NOT NULL,
                  `question_plain_3_pos` int(11) NOT NULL,
                  `question_plain_4` text NOT NULL,
                  `question_plain_4_pos` int(11) NOT NULL,
                  `question_plain_5` text NOT NULL,
                  `question_plain_5_pos` int(11) NOT NULL,
                  `max_stars_1_enabled` int(11) NOT NULL,
                  `max_stars_2_enabled` int(11) NOT NULL,
                  `max_stars_3_enabled` int(11) NOT NULL,
                  `max_stars_4_enabled` int(11) NOT NULL,
                  `max_stars_5_enabled` int(11) NOT NULL,
                  `question_options_1_enabled` int(11) NOT NULL,
                  `question_options_2_enabled` int(11) NOT NULL,
                  `question_options_3_enabled` int(11) NOT NULL,
                  `question_options_4_enabled` int(11) NOT NULL,
                  `question_options_5_enabled` int(11) NOT NULL,
                  `question_plain_1_enabled` int(11) NOT NULL,
                  `question_plain_2_enabled` int(11) NOT NULL,
                  `question_plain_3_enabled` int(11) NOT NULL,
                  `question_plain_4_enabled` int(11) NOT NULL,
                  `question_plain_5_enabled` int(11) NOT NULL,
                  `max_stars_1` int(11) NOT NULL,
                  `max_stars_1_req` int(11) NOT NULL,
                  `max_stars_2_req` int(11) NOT NULL,
                  `max_stars_3_req` int(11) NOT NULL,
                  `max_stars_4_req` int(11) NOT NULL,
                  `max_stars_5_req` int(11) NOT NULL,
                  `question_options_1_req` int(11) NOT NULL,
                  `question_options_2_req` int(11) NOT NULL,
                  `question_options_3_req` int(11) NOT NULL,
                  `question_options_4_req` int(11) NOT NULL,
                  `question_options_5_req` int(11) NOT NULL,
                  `question_plain_1_req` int(11) NOT NULL,
                  `question_plain_2_req` int(11) NOT NULL,
                  `question_plain_3_req` int(11) NOT NULL,
                  `question_plain_4_req` int(11) NOT NULL,
                  `question_plain_5_req` int(11) NOT NULL,
                  PRIMARY KEY (`id`)
        	   ) DEFAULT CHARSET=utf8;

CREATE TABLE `lh_admin_theme` (
        	       `id` int(11) NOT NULL AUTO_INCREMENT,
        	       `name` varchar(100) NOT NULL,
        	       `static_content` longtext NOT NULL,
        	       `static_js_content` longtext NOT NULL,
        	       `static_css_content` longtext NOT NULL,
        	       `header_content` text NOT NULL,
        	       `header_css` text NOT NULL,
        	       PRIMARY KEY (`id`)
        	   ) DEFAULT CHARSET=utf8;

CREATE TABLE `lh_chat_paid` ( 
        	       `id` int(11) NOT NULL AUTO_INCREMENT,  
        	       `hash` varchar(250) NOT NULL,  
        	       `chat_id` int(11) NOT NULL, 
        	        PRIMARY KEY (`id`),  
        	       KEY `hash` (`hash`),  
        	       KEY `chat_id` (`chat_id`)) DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `lh_abstract_survey_item` (
        	      `id` bigint(20) NOT NULL AUTO_INCREMENT,
				  `survey_id` int(11) NOT NULL,
				  `status` int(11) NOT NULL,
				  `chat_id` int(11) NOT NULL,
				  `user_id` int(11) NOT NULL,
				  `ftime` int(11) NOT NULL,
				  `dep_id` int(11) NOT NULL,
				  `max_stars_1` int(11) NOT NULL,
				  `max_stars_2` int(11) NOT NULL,
				  `max_stars_3` int(11) NOT NULL,
				  `max_stars_4` int(11) NOT NULL,
				  `max_stars_5` int(11) NOT NULL,
				  `question_options_1` int(11) NOT NULL,
				  `question_options_2` int(11) NOT NULL,
				  `question_options_3` int(11) NOT NULL,
				  `question_options_4` int(11) NOT NULL,
				  `question_options_5` int(11) NOT NULL,
				  `question_plain_1` text NOT NULL,
				  `question_plain_2` text NOT NULL,
				  `question_plain_3` text NOT NULL,
				  `question_plain_4` text NOT NULL,
				  `question_plain_5` text NOT NULL,
				  PRIMARY KEY (`id`),
				  KEY `survey_id` (`survey_id`),
				  KEY `chat_id` (`chat_id`),
				  KEY `user_id` (`user_id`),
				  KEY `dep_id` (`dep_id`),
				  KEY `ftime` (`ftime`),
				  KEY `max_stars_1` (`max_stars_1`),
				  KEY `max_stars_2` (`max_stars_2`),
				  KEY `max_stars_3` (`max_stars_3`),
				  KEY `max_stars_4` (`max_stars_4`),
				  KEY `max_stars_5` (`max_stars_5`),
				  KEY `question_options_1` (`question_options_1`),
				  KEY `question_options_2` (`question_options_2`),
				  KEY `question_options_3` (`question_options_3`),
				  KEY `question_options_4` (`question_options_4`),
				  KEY `question_options_5` (`question_options_5`)
        	   ) DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `lh_speech_language` (
                  `id` int(11) NOT NULL AUTO_INCREMENT,
                  `name` varchar(100) NOT NULL,
                  PRIMARY KEY (`id`)
               ) DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `lh_speech_language_dialect` (
                  `id` int(11) NOT NULL AUTO_INCREMENT,
                  `language_id` int(11) NOT NULL,
                  `lang_name` varchar(100) NOT NULL,
                  `lang_code` varchar(100) NOT NULL,
                  PRIMARY KEY (`id`),
                  KEY `language_id` (`language_id`)
               ) DEFAULT CHARSET=utf8;

INSERT INTO `lh_speech_language` (`id`, `name`) VALUES
        	   (1,	'Afrikaans'),
        	   (2,	'Bahasa Indonesia'),
        	   (3,	'Bahasa Melayu'),
        	   (4,	'Català'),
        	   (5,	'Čeština'),
        	   (6,	'Deutsch'),
        	   (7,	'English'),
        	   (8,	'Español'),
        	   (9,	'Euskara'),
        	   (10,	'Français'),
        	   (11,	'Galego'),
        	   (12,	'Hrvatski'),
        	   (13,	'IsiZulu'),
        	   (14,	'Íslenska'),
        	   (15,	'Italiano'),
        	   (16,	'Magyar'),
        	   (17,	'Nederlands'),
        	   (18,	'Norsk bokmål'),
        	   (19,	'Polski'),
        	   (20,	'Português'),
        	   (21,	'Română'),
        	   (22,	'Slovenčina'),
        	   (23,	'Suomi'),
        	   (24,	'Svenska'),
        	   (25,	'Türkçe'),
        	   (26,	'български'),
        	   (27,	'Pусский'),
        	   (28,	'Српски'),
        	   (29,	'한국어'),
        	   (30,	'中文'),
        	   (31,	'日本語'),
        	   (32,	'Lingua latīna');

INSERT INTO `lh_speech_language_dialect` (`id`, `language_id`, `lang_name`, `lang_code`) VALUES
                (1,	1,	'Afrikaans',	'af-ZA'),
                (2,	2,	'Bahasa Indonesia',	'id-ID'),
                (3,	3,	'Bahasa Melayu',	'ms-MY'),
                (4,	4,	'Català',	'ca-ES'),
                (5,	5,	'Čeština',	'cs-CZ'),
                (6,	6,	'Deutsch',	'de-DE'),
                (7,	7,	'Australia',	'en-AU'),
                (8,	7,	'Canada',	'en-CA'),
                (9,	7,	'India',	'en-IN'),
                (10,	7,	'New Zealand',	'en-NZ'),
                (11,	7,	'South Africa',	'en-ZA'),
                (12,	7,	'United Kingdom',	'en-GB'),
                (13,	7,	'United States',	'en-US'),
                (14,	8,	'Argentina',	'es-AR'),
                (15,	8,	'Bolivia',	'es-BO'),
                (16,	8,	'Chile',	'es-CL'),
                (17,	8,	'Colombia',	'es-CO'),
                (18,	8,	'Costa Rica',	'es-CR'),
                (19,	8,	'Ecuador',	'es-EC'),
                (20,	8,	'El Salvador',	'es-SV'),
                (21,	8,	'España',	'es-ES'),
                (22,	8,	'Estados Unidos',	'es-US'),
                (23,	8,	'Guatemala',	'es-GT'),
                (24,	8,	'Honduras',	'es-HN'),
                (25,	8,	'México',	'es-MX'),
                (26,	8,	'Nicaragua',	'es-NI'),
                (27,	8,	'Panamá',	'es-PA'),
                (28,	8,	'Paraguay',	'es-PY'),
                (29,	8,	'Perú',	'es-PE'),
                (30,	8,	'Puerto Rico',	'es-PR'),
                (31,	8,	'República Dominicana',	'es-DO'),
                (32,	8,	'Uruguay',	'es-UY'),
                (33,	8,	'Venezuela',	'es-VE'),
                (34,	9,	'Euskara',	'eu-ES'),
                (35,	10,	'Français',	'fr-FR'),
                (36,	11,	'Galego',	'gl-ES'),
                (37,	12,	'Hrvatski',	'hr_HR'),
                (38,	13,	'IsiZulu',	'zu-ZA'),
                (39,	14,	'Íslenska',	'is-IS'),
                (40,	15,	'Italia',	'it-IT'),
                (41,	15,	'Svizzera',	'it-CH'),
                (42,	16,	'Magyar',	'hu-HU'),
                (43,	17,	'Nederlands',	'nl-NL'),
                (44,	18,	'Norsk bokmål',	'nb-NO'),
                (45,	19,	'Polski',	'pl-PL'),
                (46,	20,	'Brasil',	'pt-BR'),
                (47,	20,	'Portugal',	'pt-PT'),
                (48,	21,	'Română',	'ro-RO'),
                (49,	22,	'Slovenčina',	'sk-SK'),
                (50,	23,	'Suomi',	'fi-FI'),
                (51,	24,	'Svenska',	'sv-SE'),
                (52,	25,	'Türkçe',	'tr-TR'),
                (53,	26,	'български',	'bg-BG'),
                (54,	27,	'Pусский',	'ru-RU'),
                (55,	28,	'Српски',	'sr-RS'),
                (56,	29,	'한국어',	'ko-KR'),
                (57,	30,	'普通话 (中国大陆)',	'cmn-Hans-CN'),
                (58,	30,	'普通话 (香港)',	'cmn-Hans-HK'),
                (59,	30,	'中文 (台灣)',	'cmn-Hant-TW'),
                (60,	30,	'粵語 (香港)',	'yue-Hant-HK'),
                (61,	31,	'日本語',	'ja-JP'),
                (62,	32,	'Lingua latīna',	'la');

CREATE TABLE IF NOT EXISTS `lh_speech_chat_language` (
                  `id` int(11) NOT NULL AUTO_INCREMENT,
                  `chat_id` int(11) NOT NULL,
                  `language_id` int(11) NOT NULL,
                  `dialect` varchar(50) NOT NULL,
                  PRIMARY KEY (`id`),
                  KEY `chat_id` (`chat_id`)
               ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `lh_chat_file` (
        	   `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
        	   `name` varchar(255) NOT NULL,
        	   `upload_name` varchar(255) NOT NULL,
        	   `size` int(11) NOT NULL,
        	   `type` varchar(255) NOT NULL,
        	   `file_path` varchar(255) NOT NULL,
        	   `extension` varchar(255) NOT NULL,
        	   `chat_id` int(11) NOT NULL,
        	   `online_user_id` int(11) NOT NULL,
        	   `user_id` int(11) NOT NULL,
        	   `date` int(11) NOT NULL,
        	   PRIMARY KEY (`id`),
        	   KEY `chat_id` (`chat_id`),
        	   KEY `online_user_id` (`online_user_id`),
        	   KEY `user_id` (`user_id`)
        	   ) DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `lh_abstract_email_template` (
				  `id` int(11) NOT NULL AUTO_INCREMENT,
				  `name` varchar(250) NOT NULL,
				  `from_name` varchar(150) NOT NULL,
				  `from_name_ac` tinyint(4) NOT NULL,
				  `from_email` varchar(150) NOT NULL,
				  `from_email_ac` tinyint(4) NOT NULL,
				  `user_mail_as_sender` tinyint(4) NOT NULL,
				  `content` text NOT NULL,
				  `subject` varchar(250) NOT NULL,
				  `bcc_recipients` varchar(200) NOT NULL,
				  `subject_ac` tinyint(4) NOT NULL,
				  `reply_to` varchar(150) NOT NULL,
				  `reply_to_ac` tinyint(4) NOT NULL,
				  `recipient` varchar(150) NOT NULL,
				  PRIMARY KEY (`id`)
				) DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS `lh_question` (
        	   `id` int(11) NOT NULL AUTO_INCREMENT,
        	   `question` varchar(250) NOT NULL,
        	   `location` varchar(250) NOT NULL,
        	   `active` int(11) NOT NULL,
        	   `priority` int(11) NOT NULL,
        	   `is_voting` int(11) NOT NULL,
        	   `question_intro` text NOT NULL,
        	   `revote` int(11) NOT NULL DEFAULT '0',
        	   PRIMARY KEY (`id`),
        	   KEY `priority` (`priority`),
        	   KEY `active_priority` (`active`,`priority`)
        	   ) DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `lh_question_answer` (
        	   `id` int(11) NOT NULL AUTO_INCREMENT,
        	   `ip` bigint(20) NOT NULL,
        	   `question_id` int(11) NOT NULL,
        	   `answer` text NOT NULL,
        	   `ctime` int(11) NOT NULL,
        	   PRIMARY KEY (`id`),
        	   KEY `ip` (`ip`),
        	   KEY `question_id` (`question_id`)
        	   ) DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `lh_question_option` (
        	   `id` int(11) NOT NULL AUTO_INCREMENT,
        	   `question_id` int(11) NOT NULL,
        	   `option_name` varchar(250) NOT NULL,
        	   `priority` tinyint(4) NOT NULL,
        	   PRIMARY KEY (`id`),
        	   KEY `question_id` (`question_id`)
        	   ) DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `lh_question_option_answer` (
        	   `id` int(11) NOT NULL AUTO_INCREMENT,
        	   `question_id` int(11) NOT NULL,
        	   `option_id` int(11) NOT NULL,
        	   `ctime` int(11) NOT NULL,
        	   `ip` bigint(20) NOT NULL,
        	   PRIMARY KEY (`id`),
        	   KEY `question_id` (`question_id`),
        	   KEY `ip` (`ip`)
        	   ) DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `lh_abstract_product` (
        	       `id` int(11) NOT NULL AUTO_INCREMENT, 
        	       `name` varchar(250) NOT NULL, 
        	       `disabled` int(11) NOT NULL, 
        	       `priority` int(11) NOT NULL, 
        	       `departament_id` int(11) NOT NULL, 
        	       KEY `departament_id` (`departament_id`), 
        	       PRIMARY KEY (`id`)) DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `lh_abstract_browse_offer_invitation` (
				  `id` int(11) NOT NULL AUTO_INCREMENT,
				  `siteaccess` varchar(10) NOT NULL,
				  `time_on_site` int(11) NOT NULL,
				  `content` longtext NOT NULL,
				  `callback_content` longtext NOT NULL,
				  `lhc_iframe_content` tinyint(4) NOT NULL,
				  `custom_iframe_url` varchar(250) NOT NULL,
				  `name` varchar(250) NOT NULL,
				  `identifier` varchar(50) NOT NULL,
				  `executed_times` int(11) NOT NULL,
				  `url` varchar(250) NOT NULL,
				  `active` int(11) NOT NULL,
				  `has_url` int(11) NOT NULL,
				  `is_wildcard` int(11) NOT NULL,
				  `referrer` varchar(250) NOT NULL,
				  `priority` varchar(250) NOT NULL,
				  `hash` varchar(40) NOT NULL,
				  `width` int(11) NOT NULL,
				  `height` int(11) NOT NULL,
				  `unit` varchar(10) NOT NULL,
				  PRIMARY KEY (`id`),
				  KEY `active` (`active`),
				  KEY `identifier` (`identifier`)
				) DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `lh_abstract_form` (
        	   `id` int(11) NOT NULL AUTO_INCREMENT,
        	   `name` varchar(100) NOT NULL,        	   
        	   `content` longtext NOT NULL,
        	   `recipient` varchar(250) NOT NULL,
        	   `active` int(11) NOT NULL,
        	   `name_attr` varchar(250) NOT NULL,
        	   `intro_attr` varchar(250) NOT NULL,
        	   `xls_columns` text NOT NULL,
        	   `pagelayout` varchar(200) NOT NULL,
        	   `post_content` text NOT NULL,
        	   PRIMARY KEY (`id`)
        	   ) DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `lh_abstract_form_collected` (
				  `id` int(11) NOT NULL AUTO_INCREMENT,
				  `form_id` int(11) NOT NULL,
				  `ctime` int(11) NOT NULL,
				  `ip` varchar(250) NOT NULL,
        	   	  `identifier` varchar(250) NOT NULL,
				  `content` longtext NOT NULL,
				  PRIMARY KEY (`id`),
				  KEY `form_id` (`form_id`)
				) DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `lh_chatbox` (
				  `id` int(11) NOT NULL AUTO_INCREMENT,
				  `identifier` varchar(50) NOT NULL,
				  `name` varchar(100) NOT NULL,
				  `chat_id` int(11) NOT NULL,
				  `active` int(11) NOT NULL,
				  PRIMARY KEY (`id`),
				  KEY `identifier` (`identifier`)
				) DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `lh_canned_msg` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`msg` longtext NOT NULL,
	`fallback_msg` text NOT NULL,
	`title` varchar(250) NOT NULL,
	`explain` varchar(250) NOT NULL,
	`position` int(11) NOT NULL,
	`department_id` int(11) NOT NULL,
	`user_id` int(11) NOT NULL,
	`delay` int(11) NOT NULL,
	`auto_send` tinyint(1) NOT NULL,
	`attr_int_1` int(11) NOT NULL,
	`attr_int_2` int(11) NOT NULL,
	`attr_int_3` int(11) NOT NULL,
	PRIMARY KEY (`id`),
	KEY `department_id` (`department_id`),
	KEY `attr_int_1` (`attr_int_1`),
	KEY `attr_int_2` (`attr_int_2`),
	KEY `attr_int_3` (`attr_int_3`),
	KEY `position_title` (`position`, `title`),
	KEY `user_id` (`user_id`)
	) DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `lh_chat_online_user_footprint` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`chat_id` int(11) NOT NULL,
	`online_user_id` int(11) NOT NULL,
	`page` varchar(250) NOT NULL,
	`vtime` varchar(250) NOT NULL,
	PRIMARY KEY (`id`),
	KEY `chat_id_vtime` (`chat_id`,`vtime`),
	KEY `online_user_id` (`online_user_id`)
	) DEFAULT CHARSET=utf8;

CREATE TABLE `lh_abstract_proactive_chat_event` (
        	       `id` int(11) NOT NULL AUTO_INCREMENT,
        	       `vid_id` int(11) NOT NULL,
        	       `ev_id` int(11) NOT NULL,
        	       `ts` int(11) NOT NULL,
        	       `val` varchar(50) NOT NULL,
        	       PRIMARY KEY (`id`),
        	       KEY `vid_id_ev_id_val_ts` (`vid_id`,`ev_id`,`val`,`ts`),
        	       KEY `vid_id_ev_id_ts` (`vid_id`,`ev_id`,`ts`)
        	   ) DEFAULT CHARSET=utf8;

CREATE TABLE `lh_abstract_proactive_chat_invitation_event` (
        	       `id` int(11) NOT NULL AUTO_INCREMENT,
        	       `invitation_id` int(11) NOT NULL,
        	       `event_id` int(11) NOT NULL,
        	       `min_number` int(11) NOT NULL,
        	       `during_seconds` int(11) NOT NULL,
        	       PRIMARY KEY (`id`),
        	       KEY `invitation_id` (`invitation_id`),
        	       KEY `event_id` (`event_id`)
        	   ) DEFAULT CHARSET=utf8;

CREATE TABLE `lh_abstract_proactive_chat_variables` (
        	       `id` int(11) NOT NULL AUTO_INCREMENT,
        	       `name` varchar(50) NOT NULL,
        	       `identifier` varchar(50) NOT NULL,
        	       `store_timeout` int(11) NOT NULL,
        	       `filter_val` int(11) NOT NULL DEFAULT '0',
        	       PRIMARY KEY (`id`),
        	       KEY `identifier` (`identifier`)
        	   ) DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `lh_users_setting` (
        	   `id` int(11) NOT NULL AUTO_INCREMENT,
        	   `user_id` int(11) NOT NULL,
        	   `identifier` varchar(50) NOT NULL,
        	   `value` text NOT NULL,
        	   PRIMARY KEY (`id`),
        	   KEY `user_id` (`user_id`,`identifier`)
        	   ) DEFAULT CHARSET=utf8;

CREATE TABLE `lh_departament_limit_group_member` (  
    	       `id` int(11) NOT NULL AUTO_INCREMENT,  
    	       `dep_id` int(11) NOT NULL,  
    	       `dep_limit_group_id` int(11) NOT NULL,  
    	       PRIMARY KEY (`id`),  
    	       KEY `dep_limit_group_id` (`dep_limit_group_id`)) 
    	       DEFAULT CHARSET=utf8;

CREATE TABLE `lh_departament_limit_group` (  
    	       `id` int(11) NOT NULL AUTO_INCREMENT,  
    	       `name` varchar(50) NOT NULL,
    	       `pending_max` int(11) NOT NULL,  
    	       PRIMARY KEY (`id`)) 
    	       DEFAULT CHARSET=utf8;

CREATE TABLE `lh_abstract_auto_responder_chat` (
                  `id` int(11) NOT NULL AUTO_INCREMENT,
                  `chat_id` int(11) NOT NULL,
                  `auto_responder_id` int(11) NOT NULL,
                  `wait_timeout_send` int(11) NOT NULL,
                  `pending_send_status` int(11) NOT NULL,
                  `active_send_status` int(11) NOT NULL,
                  PRIMARY KEY (`id`),
                  KEY `chat_id` (`chat_id`)
                ) DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `lh_users_setting_option` (
			  `identifier` varchar(50) NOT NULL,
			  `class` varchar(50) NOT NULL,
			  `attribute` varchar(40) NOT NULL,
			  PRIMARY KEY (`identifier`)
			) DEFAULT CHARSET=utf8;

INSERT INTO `lh_users_setting_option` (`identifier`, `class`, `attribute`) VALUES
        	   ('chat_message',	'',	''),
        	   ('new_chat_sound',	'',	''),
        	   ('enable_pending_list', '', ''),
        	   ('enable_active_list', '', ''),
        	   ('enable_close_list', '', ''),
        	   ('new_user_bn', '', ''),
        	   ('new_user_sound', '', ''),
        	   ('oupdate_timeout', '', ''),
        	   ('ouser_timeout', '', ''),
        	   ('o_department', '', ''),
        	   ('omax_rows', '', ''),
        	   ('ogroup_by', '', ''),
        	   ('omap_depid', '', ''),
        	   ('omap_mtimeout', '', ''),
        	   ('dwo', '', ''),
        	   ('enable_unread_list', '', '');

CREATE TABLE IF NOT EXISTS `lh_chat_config` (
                  `identifier` varchar(50) NOT NULL,
                  `value` text NOT NULL,
                  `type` tinyint(1) NOT NULL DEFAULT '0',
                  `explain` varchar(250) NOT NULL,
                  `hidden` int(11) NOT NULL DEFAULT '0',
                  PRIMARY KEY (`identifier`)
                ) DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS `lh_chat_online_user` (
                  `id` int(11) NOT NULL AUTO_INCREMENT,
                  `vid` varchar(50) NOT NULL,
                  `ip` varchar(50) NOT NULL,
                  `current_page` text NOT NULL,
	   	  `page_title` varchar(250) NOT NULL,
                  `referrer` text NOT NULL,
                  `chat_id` int(11) NOT NULL,
                  `invitation_seen_count` int(11) NOT NULL,
	   	  `invitation_id` int(11) NOT NULL,
                  `last_visit` int(11) NOT NULL,
	   	  `first_visit` int(11) NOT NULL,
	   	  `total_visits` int(11) NOT NULL,
	   	  `pages_count` int(11) NOT NULL,
	   	  `tt_pages_count` int(11) NOT NULL,
	   	  `invitation_count` int(11) NOT NULL,
	   	  `last_check_time` int(11) NOT NULL,
	   	  `dep_id` int(11) NOT NULL,
                  `user_agent` varchar(250) NOT NULL,
                  `notes` varchar(250) NOT NULL,
                  `user_country_code` varchar(50) NOT NULL,
                  `user_country_name` varchar(50) NOT NULL,
                  `visitor_tz` varchar(50) NOT NULL,
                  `operator_message` text NOT NULL,
                  `operator_user_proactive` varchar(100) NOT NULL,
                  `operator_user_id` int(11) NOT NULL,
                  `message_seen` int(11) NOT NULL,
                  `message_seen_ts` int(11) NOT NULL,
                  `user_active` int(11) NOT NULL,
	   	  `lat` varchar(10) NOT NULL,
		  `lon` varchar(10) NOT NULL,
		  `city` varchar(100) NOT NULL,
	   	  `reopen_chat` int(11) NOT NULL,
	   	  `time_on_site` int(11) NOT NULL,
		  `tt_time_on_site` int(11) NOT NULL,
	   	  `requires_email` int(11) NOT NULL,
	   	  `requires_username` int(11) NOT NULL,
	   	  `requires_phone` int(11) NOT NULL,
	   	  `screenshot_id` int(11) NOT NULL,
	   	  `identifier` varchar(50) NOT NULL,
	   	  `operation` text NOT NULL,
	   	  `online_attr_system` text NOT NULL,
	   	  `operation_chat` text NOT NULL,
	   	  `online_attr` text NOT NULL,
                  PRIMARY KEY (`id`),
                  KEY `vid` (`vid`),
				  KEY `dep_id` (`dep_id`),
				  KEY `last_visit_dep_id` (`last_visit`,`dep_id`)
                ) DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `lh_abstract_proactive_chat_invitation` (
			  `id` int(11) NOT NULL AUTO_INCREMENT,
			  `siteaccess` varchar(10) NOT NULL,
			  `time_on_site` int(11) NOT NULL,
			  `pageviews` int(11) NOT NULL,
			  `message` text NOT NULL,
			  `message_returning` text NOT NULL,
			  `executed_times` int(11) NOT NULL,
			  `dep_id` int(11) NOT NULL,
			  `hide_after_ntimes` int(11) NOT NULL,
			  `name` varchar(50) NOT NULL,
			  `operator_ids` varchar(100) NOT NULL,
			  `wait_message` text NOT NULL,
			  `timeout_message` text NOT NULL,
			  `message_returning_nick` varchar(250) NOT NULL,
			  `referrer` varchar(250) NOT NULL,
			  `wait_timeout` int(11) NOT NULL,
			  `show_random_operator` int(11) NOT NULL,
			  `operator_name` varchar(100) NOT NULL,
			  `position` int(11) NOT NULL,
			  `event_invitation` int(11) NOT NULL,
			  `dynamic_invitation` int(11) NOT NULL,
        	   	  `identifier` varchar(50) NOT NULL,
        	   	  `tag` varchar(50) NOT NULL,
        	   	  `requires_email` int(11) NOT NULL,
        	   	  `iddle_for` int(11) NOT NULL,
        	   	  `event_type` int(11) NOT NULL,
        	   	  `requires_username` int(11) NOT NULL,
        	   	  `requires_phone` int(11) NOT NULL,
        	   	  `repeat_number` int(11) NOT NULL DEFAULT '1',
				  PRIMARY KEY (`id`),
				  KEY `time_on_site_pageviews_siteaccess_position` (`time_on_site`,`pageviews`,`siteaccess`,`identifier`,`position`),
        	      KEY `identifier` (`identifier`),
        	      KEY `dynamic_invitation` (`dynamic_invitation`),
        	      KEY `tag` (`tag`),
        	      KEY `dep_id` (`dep_id`)
				) DEFAULT CHARSET=utf8;");
        	   
        	   $db->query("CREATE TABLE IF NOT EXISTS `lh_chat_accept` (
        	   `id` int(11) NOT NULL AUTO_INCREMENT,
        	   `chat_id` int(11) NOT NULL,
        	   `hash` varchar(50) NOT NULL,
        	   `ctime` int(11) NOT NULL,
        	   `wused` int(11) NOT NULL,
        	   PRIMARY KEY (`id`),
        	   KEY `hash` (`hash`)
        	   ) DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `lh_departament` (
			  `id` int(11) NOT NULL AUTO_INCREMENT,
			  `name` varchar(100) NOT NULL,
			  `email` varchar(100) NOT NULL,
			  `xmpp_recipients` text NOT NULL,
			  `xmpp_group_recipients` text NOT NULL,
			  `priority` int(11) NOT NULL,
			  `sort_priority` int(11) NOT NULL,
			  `department_transfer_id` int(11) NOT NULL,
			  `transfer_timeout` int(11) NOT NULL,
			  `disabled` int(11) NOT NULL,
			  `hidden` int(11) NOT NULL,
			  `delay_lm` int(11) NOT NULL,
			  `max_active_chats` int(11) NOT NULL,
			  `max_timeout_seconds` int(11) NOT NULL,
			  `identifier` varchar(50) NOT NULL,
			  `mod_start_hour` int(4) NOT NULL,
			  `mod_end_hour` int(4) NOT NULL,
			  `tud_start_hour` int(4) NOT NULL,
			  `tud_end_hour` int(4) NOT NULL,
			  `wed_start_hour` int(4) NOT NULL,
			  `wed_end_hour` int(4) NOT NULL,
			  `thd_start_hour` int(4) NOT NULL,
			  `thd_end_hour` int(4) NOT NULL,
			  `frd_start_hour` int(4) NOT NULL,
			  `frd_end_hour` int(4) NOT NULL,
			  `sad_start_hour` int(4) NOT NULL,
			  `sad_end_hour` int(4) NOT NULL,
			  `sud_start_hour` int(4) NOT NULL,
			  `sud_end_hour` int(4) NOT NULL,
			  `nc_cb_execute` tinyint(1) NOT NULL,
			  `na_cb_execute` tinyint(1) NOT NULL,
			  `inform_unread` tinyint(1) NOT NULL,
			  `active_balancing` tinyint(1) NOT NULL,
			  `visible_if_online` tinyint(1) NOT NULL,
			  `inform_close` int(11) NOT NULL,
			  `inform_unread_delay` int(11) NOT NULL,
			  `inform_options` varchar(250) NOT NULL,
			  `online_hours_active` tinyint(1) NOT NULL,
			  `inform_delay` int(11) NOT NULL,
			  `attr_int_1` int(11) NOT NULL,
			  `attr_int_2` int(11) NOT NULL,
			  `attr_int_3` int(11) NOT NULL,
			  `pending_max` int(11) NOT NULL,
			  `pending_group_max` int(11) NOT NULL,
			  `active_chats_counter` int(11) NOT NULL,
			  `pending_chats_counter` int(11) NOT NULL,
			  `closed_chats_counter` int(11) NOT NULL,
			  `inform_close_all` int(11) NOT NULL,
			  `inform_close_all_email` varchar(250) NOT NULL,
			  `product_configuration` varchar(250) NOT NULL,
			  PRIMARY KEY (`id`),
			  KEY `identifier` (`identifier`),
			  KEY `attr_int_1` (`attr_int_1`),
			  KEY `attr_int_2` (`attr_int_2`),
			  KEY `attr_int_3` (`attr_int_3`),
			  KEY `disabled_hidden` (`disabled`, `hidden`),
			  KEY `sort_priority_name` (`sort_priority`, `name`),
			  KEY `active_mod` (`online_hours_active`,`mod_start_hour`,`mod_end_hour`),
			  KEY `active_tud` (`online_hours_active`,`tud_start_hour`,`tud_end_hour`),
			  KEY `active_wed` (`online_hours_active`,`wed_start_hour`,`wed_end_hour`),
			  KEY `active_thd` (`online_hours_active`,`thd_start_hour`,`thd_end_hour`),
			  KEY `active_frd` (`online_hours_active`,`frd_start_hour`,`frd_end_hour`),
			  KEY `active_sad` (`online_hours_active`,`sad_start_hour`,`sad_end_hour`),
			  KEY `active_sud` (`online_hours_active`,`sud_start_hour`,`sud_end_hour`)
			) DEFAULT CHARSET=utf8;

CREATE TABLE `lh_departament_group_user` (
                  `id` int(11) NOT NULL AUTO_INCREMENT,
                  `dep_group_id` int(11) NOT NULL,
                  `user_id` int(11) NOT NULL,
                  PRIMARY KEY (`id`),
                  KEY `dep_group_id` (`dep_group_id`),
                  KEY `user_id` (`user_id`)
                ) DEFAULT CHARSET=utf8;

CREATE TABLE `lh_abstract_product_departament` (
        	       `id` int(11) NOT NULL AUTO_INCREMENT,
        	       `product_id` int(11) NOT NULL,
        	       `departament_id` int(11) NOT NULL,
        	       PRIMARY KEY (`id`),
        	       KEY `departament_id` (`departament_id`)
        	   ) DEFAULT CHARSET=utf8;

CREATE TABLE `lh_departament_group_member` (
                  `id` int(11) NOT NULL AUTO_INCREMENT,
                  `dep_id` int(11) NOT NULL,
                  `dep_group_id` int(11) NOT NULL,
                  PRIMARY KEY (`id`),
                  KEY `dep_group_id` (`dep_group_id`)
                ) DEFAULT CHARSET=utf8;

CREATE TABLE `lh_departament_group` (
                  `id` int(11) NOT NULL AUTO_INCREMENT,
                  `name` varchar(50) NOT NULL,
                  PRIMARY KEY (`id`)
                ) DEFAULT CHARSET=utf8;

CREATE TABLE `lh_canned_msg_tag_link` (  
		`id` int(11) NOT NULL AUTO_INCREMENT,  
		`tag_id` int(11) NOT NULL,
		`canned_id` int(11) NOT NULL,  
		PRIMARY KEY (`id`), 
		KEY `canned_id` (`canned_id`), 
		KEY `tag_id` (`tag_id`)) 
		DEFAULT CHARSET=utf8;

CREATE TABLE `lh_canned_msg_tag` (  
		`id` int(11) NOT NULL AUTO_INCREMENT,  
		`tag` varchar(40) NOT NULL, 
		PRIMARY KEY (`id`), 
		KEY `tag` (`tag`)) 
		DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `lh_departament_custom_work_hours` (
		  `id` int(11) NOT NULL AUTO_INCREMENT,
		  `dep_id` int(11) NOT NULL,
		  `date_from` int(11) NOT NULL,
		  `date_to` int(11) NOT NULL,
		  `start_hour` int(11) NOT NULL,
		  `end_hour` int(11) NOT NULL,
		  PRIMARY KEY (`id`),
		  KEY `dep_id` (`dep_id`),
		  KEY `date_from` (`date_from`),
		  KEY `search_active` (`date_from`, `date_to`, `dep_id`)
		) DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `lh_group` (
               `id` int(11) NOT NULL AUTO_INCREMENT,
               `name` varchar(50) NOT NULL,
               `disabled` int(11) NOT NULL,
               PRIMARY KEY (`id`),
               KEY `disabled` (`disabled`)
               ) DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `lh_role` (
                  `id` int(11) NOT NULL AUTO_INCREMENT,
                  `name` varchar(50) NOT NULL,
                  PRIMARY KEY (`id`)
                ) DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `lh_grouprole` (
                  `id` int(11) NOT NULL AUTO_INCREMENT,
                  `group_id` int(11) NOT NULL,
                  `role_id` int(11) NOT NULL,
                  PRIMARY KEY (`id`),
                  KEY `group_id` (`role_id`,`group_id`),
                  KEY `group_id_primary` (`group_id`)
                ) DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `lh_users` (
                  `id` int(11) NOT NULL AUTO_INCREMENT,
                  `username` varchar(40) NOT NULL,
                  `password` varchar(200) NOT NULL,
                  `email` varchar(100) NOT NULL,
                  `time_zone` varchar(100) NOT NULL,
                  `name` varchar(100) NOT NULL,
                  `surname` varchar(100) NOT NULL,
                  `filepath` varchar(200) NOT NULL,
                  `filename` varchar(200) NOT NULL,
                  `job_title` varchar(100) NOT NULL,
                  `departments_ids` varchar(100) NOT NULL,
                  `chat_nickname` varchar(100) NOT NULL,
                  `xmpp_username` varchar(200) NOT NULL,
                  `session_id` varchar(40) NOT NULL,
                  `operation_admin` text NOT NULL,
                  `skype` varchar(50) NOT NULL,
                  `disabled` tinyint(4) NOT NULL,
                  `hide_online` tinyint(1) NOT NULL,
                  `all_departments` tinyint(1) NOT NULL,
                  `invisible_mode` tinyint(1) NOT NULL,
                  `inactive_mode` tinyint(1) NOT NULL,
                  `rec_per_req` tinyint(1) NOT NULL,
                  `active_chats_counter` int(11) NOT NULL,
                  `closed_chats_counter` int(11) NOT NULL,
                  `pending_chats_counter` int(11) NOT NULL,
                  `attr_int_1` int(11) NOT NULL,
                  `attr_int_2` int(11) NOT NULL,
                  `attr_int_3` int(11) NOT NULL,
                  PRIMARY KEY (`id`),
                  KEY `hide_online` (`hide_online`),
                  KEY `rec_per_req` (`rec_per_req`),
                  KEY `email` (`email`),
                  KEY `xmpp_username` (`xmpp_username`)
                ) DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `lh_userdep` (
                  `id` int(11) NOT NULL AUTO_INCREMENT,
                  `user_id` int(11) NOT NULL,
                  `dep_id` int(11) NOT NULL,
                  `last_activity` int(11) NOT NULL,
                  `hide_online` int(11) NOT NULL,
                  `last_accepted` int(11) NOT NULL,
                  `active_chats` int(11) NOT NULL,
                  `type` int(11) NOT NULL DEFAULT '0',
                  `hide_online_ts` int(11) NOT NULL DEFAULT '0',
                  `dep_group_id` int(11) NOT NULL DEFAULT '0',
                  PRIMARY KEY (`id`),
                  KEY `last_activity_hide_online_dep_id` (`last_activity`,`hide_online`,`dep_id`),
                  KEY `dep_id` (`dep_id`),
                  KEY `user_id_type` (`user_id`,`type`)
                ) DEFAULT CHARSET=utf8;

INSERT INTO `lh_userdep` (`user_id`,`dep_id`,`last_activity`,`hide_online`,`last_accepted`,`active_chats`,`type`,`dep_group_id`) VALUES ({$UserData->id},0,0,0,0,0,0,0)

CREATE TABLE `lh_group_work` (  
		`id` int(11) NOT NULL AUTO_INCREMENT,  
		`group_id` int(11) NOT NULL, 
		`group_work_id` int(11) NOT NULL, 
		PRIMARY KEY (`id`), 
		KEY `group_id` (`group_id`)) 
		DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `lh_transfer` (
		  `id` int(11) NOT NULL AUTO_INCREMENT,
		  `chat_id` int(11) NOT NULL,
		  `dep_id` int(11) NOT NULL,
		  `transfer_user_id` int(11) NOT NULL,
		  `from_dep_id` int(11) NOT NULL,
		  `transfer_to_user_id` int(11) NOT NULL,
		  PRIMARY KEY (`id`),
		  KEY `dep_id` (`dep_id`),
		  KEY `transfer_user_id_dep_id` (`transfer_user_id`,`dep_id`),
		  KEY `transfer_to_user_id` (`transfer_to_user_id`)
		) DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `lh_users_remember` (
		 `id` int(11) NOT NULL AUTO_INCREMENT,
		 `user_id` int(11) NOT NULL,
		 `mtime` int(11) NOT NULL,
		 PRIMARY KEY (`id`)
		) DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `lh_abstract_rest_api_key` (
                    `id` int(11) NOT NULL AUTO_INCREMENT,
                    `api_key` varchar(50) NOT NULL,
                    `user_id` int(11) NOT NULL,
                    `active` int(11) NOT NULL DEFAULT '0',
                    PRIMARY KEY (`id`),
                    KEY `api_key` (`api_key`),
                    KEY `user_id` (`user_id`)
                ) DEFAULT CHARSET=utf8;

CREATE TABLE `lh_users_session` (
                  `id` int(11) NOT NULL AUTO_INCREMENT,
                  `token` varchar(40) NOT NULL,
                  `device_type` int(11) NOT NULL,
                  `device_token` varchar(255) NOT NULL,
                  `user_id` int(11) NOT NULL,
                  `created_on` int(11) NOT NULL,
                  `updated_on` int(11) NOT NULL,
                  `expires_on` int(11) NOT NULL,
                  PRIMARY KEY (`id`),
                  KEY `device_token_device_type` (`device_token`,`device_type`),
                  KEY `token` (`token`)
                ) DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `lh_msg` (
		  `id` int(11) NOT NULL AUTO_INCREMENT,
		  `msg` longtext NOT NULL,
		  `time` int(11) NOT NULL,
		  `chat_id` int(11) NOT NULL DEFAULT '0',
		  `user_id` int(11) NOT NULL DEFAULT '0',
		  `name_support` varchar(100) NOT NULL,
		  PRIMARY KEY (`id`),
		  KEY `chat_id_id` (`chat_id`, `id`),
		  KEY `user_id` (`user_id`)
		) DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `lh_forgotpasswordhash` (
                `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY ,
                `user_id` INT NOT NULL ,
                `hash` VARCHAR( 40 ) NOT NULL ,
                `created` INT NOT NULL
                ) DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `lh_groupuser` (
                  `id` int(11) NOT NULL AUTO_INCREMENT,
                  `group_id` int(11) NOT NULL,
                  `user_id` int(11) NOT NULL,
                  PRIMARY KEY (`id`),
                  KEY `group_id` (`group_id`),
                  KEY `user_id` (`user_id`),
                  KEY `group_id_2` (`group_id`,`user_id`)
                ) DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `lh_rolefunction` (
                  `id` int(11) NOT NULL AUTO_INCREMENT,
                  `role_id` int(11) NOT NULL,
                  `module` varchar(100) NOT NULL,
                  `function` varchar(100) NOT NULL,
                  PRIMARY KEY (`id`),
                  KEY `role_id` (`role_id`)
                ) DEFAULT CHARSET=utf8;"