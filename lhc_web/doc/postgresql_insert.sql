
START TRANSACTION;
INSERT INTO lh_speech_language (id, name) VALUES
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
INSERT INTO lh_speech_language_dialect (id, language_id, lang_name, lang_code) VALUES
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
INSERT INTO lh_users_setting_option (identifier, class, attribute) VALUES
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



INSERT INTO lh_abstract_email_template (id, name, from_name, from_name_ac, from_email, from_email_ac, content, subject, subject_ac, reply_to, reply_to_ac, recipient, bcc_recipients, user_mail_as_sender) VALUES
	(1,	'Send mail to user',	'Live Helper Chat',	0,	'',	0,	'Dear {user_chat_nick},rnrn{additional_message}rnrnLive Support response:rn{messages_content}rnrnSincerely,rnLive Support Teamrn',	'{name_surname} has responded to your request',	1,	'',	1,	'',	'',	0),
	(2,	'Support request from user',	'',	0,	'',	0,	'Hello,rnrnUser request data:rnName: {name}rnEmail: {email}rnPhone: {phone}rnDepartment: {department}rnCountry: {country}rnCity: {city}rnIP: {ip}rnrnMessage:rn{message}rnrnAdditional data, if any:rn{additional_data}rnrnURL of page from which user has send request:rn{url_request}rnrnLink to chat if any:rn{prefillchat}rnrnSincerely,rnLive Support Team',	'{name}, {country}, {department}, Support request from user',	0,	'',	0,	'{$adminEmail}',	'',	0),
	(3,	'User mail for himself',	'Live Helper Chat',	0,	'',	0,	'Dear {user_chat_nick},rnrnTranscript:rn{messages_content}rnChat ID: {chat_id}nrnSincerely,rnLive Support Teamrn',	'Chat transcript',	0,	'',	0,	'',	'',	0),
	(4,	'New chat request',	'Live Helper Chat',	0,	'',	0,	'Hello,rnrnUser request data:rnName: {name}rnEmail: {email}rnPhone: {phone}rnDepartment: {department}rnCountry: {country}rnCity: {city}rnIP: {ip}rnCreated:	{created}rnUser left:	{user_left}rnWaited:	{waited}rnChat duration:	{chat_duration}rnrnMessage:rn{message}rnrnURL of page from which user has send request:rn{url_request}rnrnClick to accept chat automaticallyrn{url_accept}rnrnSurveyrn{survey}rnrnSincerely,rnLive Support Team',	'New chat request',	0,	'',	0,	'{$adminEmail}',	'',	0),
	(5,	'Chat was closed',	'Live Helper Chat',	0,	'',	0,	'Hello,rnrn{operator} has closed a chatrnName: {name}rnEmail: {email}rnPhone: {phone}rnDepartment: {department}rnCountry: {country}rnCity: {city}rnIP: {ip}rnCreated:	{created}rnUser left:	{user_left}rnWaited:	{waited}rnChat duration:	{chat_duration}rnrnMessage:rn{message}rnrnAdditional data, if any:rn{additional_data}rnrnURL of page from which user has send request:rn{url_request}rnrnSurvey:rn{survey}rnrnSincerely,rnLive Support Team',	'Chat was closed',	0,	'',	0,	'{$adminEmail}',	'',	0),
	(6,	'New FAQ question',	'Live Helper Chat',	0,	'',	0,	'Hello,rnrnNew FAQ questionrnEmail: {email}rnrnQuestion:rn{question}rnrnQuestion URL:rn{url_question}rnrnURL to answer a question:rn{url_request}rnrnSincerely,rnLive Support Team',	'New FAQ question',	0,	'',	0,	'{$adminEmail}',	'',	0),
	(7,	'New unread message',	'Live Helper Chat',	0,	'',	0,	'Hello,rnrnUser request data:rnName: {name}rnEmail: {email}rnPhone: {phone}rnDepartment: {department}rnCountry: {country}rnCity: {city}rnIP: {ip}rnCreated:	{created}rnUser left:	{user_left}rnWaited:	{waited}rnChat duration:	{chat_duration}rnrnMessage:rn{message}rnrnURL of page from which user has send request:rn{url_request}rnrnClick to accept chat automaticallyrn{url_accept}rnrnSurvey:rn{survey}rnrnSincerely,rnLive Support Team',	'New unread message',	0,	'',	0,	'{$adminEmail}',	'',	0),
	(8,	'Filled form',	'MCFC',	0,	'',	0,	'Hello,rnrnUser has filled a formrnForm name - {form_name}rnUser IP - {ip}rnDownload filled data - {url_download}rnView filled data - {url_view}rnrn{content}rnrnSincerely,rnLive Support Team',	'Filled form - {form_name}',	0,	'',	0,	'{$adminEmail}',	'',	0),
	(9,	'Chat was accepted',	'Live Helper Chat',	0,	'',	0,	'Hello,rnrnOperator {user_name} has accepted a chat [{chat_id}]rnrnUser request data:rnName: {name}rnEmail: {email}rnPhone: {phone}rnDepartment: {department}rnCountry: {country}rnCity: {city}rnIP: {ip}rnCreated:	{created}rnUser left:	{user_left}rnWaited:	{waited}rnChat duration:	{chat_duration}rnrnMessage:rn{message}rnrnURL of page from which user has send request:rn{url_request}rnrnClick to accept chat automaticallyrn{url_accept}rnrnSurvey:rn{survey}rnrnSincerely,rnLive Support Team',	'Chat was accepted [{chat_id}]',	0,	'',	0,	'{$adminEmail}',	'',	0),
	(10,	'Permission request',	'Live Helper Chat',	0,	'',	0,	'Hello,rnrnOperator {user} has requested these permissionsnrn{permissions}rnrnSincerely,rnLive Support Team',	'Permission request from {user}',	0,	'',	0,	'',	'',	0),
	(11,	'You have unread messages',	'Live Helper Chat',	0,	'',	0,	'Hello,rnrnOperator {operator} has answered to yournrn{messages}rnrnSincerely,rnLive Support Team',	'Operator has answered to your request',	0,	'',	0,	'',	'',	0);

INSERT INTO lh_chat_config (identifier, value, type, explain, hidden) VALUES
                ('tracked_users_cleanup',	'160',	0,	'How many days keep records of online users.',	0),
        	   	('list_online_operators', '0', '0', 'List online operators.', '0'),
        	   	('voting_days_limit',	'7',	0,	'How many days voting widget should not be expanded after last show',	0),
                ('track_online_visitors',	'1',	0,	'Enable online site visitors tracking',	0),
        	   	('pro_active_invite',	'1',	0,	'Is pro active chat invitation active. Online users tracking also has to be enabled',	0),
                ('customer_company_name',	'Live Helper Chat',	0,	'Your company name - visible in bottom left corner',	0),
                ('customer_site_url',	'http://livehelperchat.com',	0,	'Your site URL address',	0),
        	   	('smtp_data',	'a:5:{s:4:"host";s:0:"";s:4:"port";s:2:"25";s:8:"use_smtp";i:0;s:8:"username";s:0:"";s:8:"password";s:0:"";}',	0,	'SMTP configuration',	1),
        	    ('chatbox_data',	'a:6:{i:0;b:0;s:20:"chatbox_auto_enabled";i:0;s:19:"chatbox_secret_hash";s:{$randomHashLength}:"{$randomHash}";s:20:"chatbox_default_name";s:7:"Chatbox";s:17:"chatbox_msg_limit";i:50;s:22:"chatbox_default_opname";s:7:"Manager";}',	0,	'Chatbox configuration',	1),
                ('start_chat_data',	'a:23:{i:0;b:0;s:21:"name_visible_in_popup";b:1;s:27:"name_visible_in_page_widget";b:1;s:19:"name_require_option";s:8:"required";s:22:"email_visible_in_popup";b:0;s:28:"email_visible_in_page_widget";b:0;s:20:"email_require_option";s:8:"required";s:24:"message_visible_in_popup";b:1;s:30:"message_visible_in_page_widget";b:1;s:22:"message_require_option";s:8:"required";s:22:"phone_visible_in_popup";b:0;s:28:"phone_visible_in_page_widget";b:0;s:20:"phone_require_option";s:8:"required";s:21:"force_leave_a_message";b:0;s:29:"offline_name_visible_in_popup";b:1;s:35:"offline_name_visible_in_page_widget";b:1;s:27:"offline_name_require_option";s:8:"required";s:30:"offline_phone_visible_in_popup";b:0;s:36:"offline_phone_visible_in_page_widget";b:0;s:28:"offline_phone_require_option";s:8:"required";s:32:"offline_message_visible_in_popup";b:1;s:38:"offline_message_visible_in_page_widget";b:1;s:30:"offline_message_require_option";s:8:"required";}',	0,	'',	1),
                ('application_name',	'a:6:{s:3:"eng";s:31:"Live Helper Chat - live support";s:3:"lit";s:26:"Live Helper Chat - pagalba";s:3:"hrv";s:0:"";s:3:"esp";s:0:"";s:3:"por";s:0:"";s:10:"site_admin";s:31:"Live Helper Chat - live support";}',	1,	'Support application name, visible in browser title.',	0),
                ('track_footprint',	'0',	0,	'Track users footprint. For this also online visitors tracking should be enabled',	0),
                ('pro_active_limitation',	'-1',	0,	'Pro active chats invitations limitation based on pending chats, (-1) do not limit, (0,1,n+1) number of pending chats can be for invitation to be shown.',	0),
                ('pro_active_show_if_offline',	'0',	0,	'Should invitation logic be executed if there is no online operators',	0),
                ('export_hash',	'{$exportHash}',	0,	'Chats export secret hash',	0),
                ('message_seen_timeout', 24, 0, 'Proactive message timeout in hours. After how many hours proactive chat mesasge should be shown again.',	0),
                ('reopen_chat_enabled',1,	0,	'Reopen chat functionality enabled',	0),
                ('ignorable_ip',	'',	0,	'Which ip should be ignored in online users list, separate by comma',0),
                ('run_departments_workflow', 0, 0, 'Should cronjob run departments transfer workflow, even if user leaves a chat',	0),
                ('geo_location_data', 'a:3:{s:4:"zoom";i:4;s:3:"lat";s:7:"49.8211";s:3:"lng";s:7:"11.7835";}', '0', '', '1'),
                ('xmp_data','a:14:{i:0;b:0;s:4:"host";s:15:"talk.google.com";s:6:"server";s:9:"gmail.com";s:8:"resource";s:6:"xmpphp";s:4:"port";s:4:"5222";s:7:"use_xmp";i:0;s:8:"username";s:0:"";s:8:"password";s:0:"";s:11:"xmp_message";s:98:"New chat request [{chat_id}] from [{department}]rn{messages}rnClick to accept a chatrn{url_accept}";s:10:"recipients";s:0:"";s:20:"xmp_accepted_message";s:89:"{user_name} has accepted a chat [{chat_id}] from [{department}]rn{messages}rn{url_accept}";s:16:"use_standard_xmp";i:0;s:15:"test_recipients";s:0:"";s:21:"test_group_recipients";s:0:"";}',0,'XMP data',1),
                ('run_unaswered_chat_workflow', 0, 0, 'Should cronjob run unanswered chats workflow and execute unaswered chats callback, 0 - no, any other number bigger than 0 is a minits how long chat have to be not accepted before executing callback.',0),
                ('disable_popup_restore', 0, 0, 'Disable option in widget to open new window. Restore icon will be hidden',	0),
                ('accept_tos_link', '#', 0, 'Change to your site Terms of Service', 0),
                ('hide_button_dropdown', '0', 0, 'Hide close button in dropdown', 0),
                ('on_close_exit_chat', '0', 0, 'On chat close exit chat', 0),
                ('activity_timeout', '5', 0, 'How long operator should go offline automatically because of inactivity. Value in minutes', 0),
                ('product_enabled_module','0','0','Product module is enabled', '1'),
                ('product_show_departament','0','0','Enable products show by departments', '1'),
                ('paidchat_data','','0','Paid chat configuration','1'),
                ('disable_iframe_sharing',	'1',	0,	'Disable iframes in sharing mode',	0),
                ('file_configuration',	'a:7:{i:0;b:0;s:5:"ft_op";s:43:"gif|jpe?g|png|zip|rar|xls|doc|docx|xlsx|pdf";s:5:"ft_us";s:26:"gif|jpe?g|png|doc|docx|pdf";s:6:"fs_max";i:2048;s:18:"active_user_upload";b:0;s:16:"active_op_upload";b:1;s:19:"active_admin_upload";b:1;}',	0,	'Files configuration item',	1),
                ('accept_chat_link_timeout',	'300',	0,	'How many seconds chat accept link is valid. Set 0 to force login all the time manually.',	0),
                ('session_captcha',0,	0,	'Use session captcha. LHC have to be installed on the same domain or subdomain.',	0),
                ('sync_sound_settings',	'a:16:{i:0;b:0;s:12:"repeat_sound";i:1;s:18:"repeat_sound_delay";i:5;s:10:"show_alert";b:0;s:22:"new_chat_sound_enabled";b:1;s:31:"new_message_sound_admin_enabled";b:1;s:30:"new_message_sound_user_enabled";b:1;s:14:"online_timeout";d:300;s:22:"check_for_operator_msg";d:10;s:21:"back_office_sinterval";d:10;s:22:"chat_message_sinterval";d:3.5;s:20:"long_polling_enabled";b:0;s:30:"polling_chat_message_sinterval";d:1.5;s:29:"polling_back_office_sinterval";d:5;s:18:"connection_timeout";i:30;s:28:"browser_notification_message";b:0;}',	0,	'',	1),
                ('sound_invitation', 1, 0, 'Play sound on invitation to chat.',	0),
                ('explicit_http_mode', '',0,'Please enter explicit http mode. Either http: or https:, do not forget : at the end.', '0'),
                ('track_domain',	'',	0,	'Set your domain to enable user tracking across different domain subdomains.',	0),
                ('max_message_length','500',0,'Maximum message length in characters', '0'),
                ('need_help_tip','1',0,'Show need help tooltip?', '0'),
                ('need_help_tip_timeout','24',0,'Need help tooltip timeout, after how many hours show again tooltip?', '0'),
                ('use_secure_cookie','0',0,'Use secure cookie, check this if you want to force SSL all the time', '0'),
                ('faq_email_required','0',0,'Is visitor e-mail required for FAQ', '0'),
                ('disable_print','0',0,'Disable chat print', '0'),
                ('hide_disabled_department','1',0,'Hide disabled department widget', '0'),
                ('disable_send','0',0,'Disable chat transcript send', '0'),
                ('ignore_user_status','0',0,'Ignore users online statuses and use departments online hours', '0'),
                ('bbc_button_visible','1',0,'Show BB Code button', '0'),
                ('activity_track_all','0','0','Track all logged operators activity and ignore their individual settings.','0'),
                ('allow_reopen_closed','1', 0, 'Allow user to reopen closed chats?', '0'),
                ('reopen_as_new','1', 0, 'Reopen closed chat as new? Otherwise it will be reopened as active.', '0'),
                ('default_theme_id','0', 0, 'Default theme ID.', '1'),  
                ('default_admin_theme_id','0', 0, 'Default admin theme ID', '1'),  
                ('translation_data',	'a:6:{i:0;b:0;s:19:"translation_handler";s:4:"bing";s:19:"enable_translations";b:0;s:14:"bing_client_id";s:0:"";s:18:"bing_client_secret";s:0:"";s:14:"google_api_key";s:0:"";}',	0,	'Translation data',	1),              
                ('disable_html5_storage','1',0,'Disable HMTL5 storage, check it if your site is switching between http and https', '0'),
                ('automatically_reopen_chat','1',0,'Automatically reopen chat on widget open', '0'),
                ('autoclose_timeout','0', 0, 'Automatic chats closing. 0 - disabled, n > 0 time in minutes before chat is automatically closed', '0'),
                ('autopurge_timeout','0', 0, 'Automatic chats purging. 0 - disabled, n > 0 time in minutes before chat is automatically deleted', '0'),
                ('update_ip',	'127.0.0.1',	0,	'Which ip should be allowed to update DB by executing http request, separate by comma?',0),
                ('track_if_offline',	'0',	0,	'Track online visitors even if there is no online operators',0),
                ('min_phone_length','8',0,'Minimum phone number length',0),
                ('mheight','',0,'Messages box height',0),
                ('inform_unread_message','0',0,'Inform visitor about unread messages from operator, value in minutes. 0 - disabled',0),
                ('dashboard_order', '[["online_operators","departments_stats","online_visitors"],["pending_chats","unread_chats","transfered_chats"],["active_chats","closed_chats"]]', '0', 'Home page dashboard widgets order', '0'),
                ('banned_ip_range','',0,'Which ip should not be allowed to chat',0),
                ('suggest_leave_msg','1',0,'Suggest user to leave a message then user chooses offline department',0),
                ('checkstatus_timeout','0',0,'Interval between chat status checks in seconds, 0 disabled.',0),
                ('show_language_switcher','0',0,'Show users option to switch language at widget',0),
                ('sharing_auto_allow','0',0,'Do not ask permission for users to see their screen',0),
                ('sharing_nodejs_enabled','0',0,'NodeJs support enabled',0),
                ('sharing_nodejs_path','',0,'socket.io path, optional',0),
                ('online_if','0','0','','0'),
                ('track_mouse_activity','0','0','Should mouse movement be tracked as activity measure, if not checked only basic events would be tracked','0'),
                ('track_activity','0','0','Track users activity on site?','0'),
                ('autologin_data','a:3:{i:0;b:0;s:11:"secret_hash";s:16:"please_change_me";s:7:"enabled";i:0;}',0,'Autologin configuration data',	1),
                ('sharing_nodejs_secure','0',0,'Connect to NodeJs in https mode',0),
                ('disable_js_execution','1',0,'Disable JS execution in Co-Browsing operator window',0),
                ('sharing_nodejs_socket_host','',0,'Host where NodeJs is running',0),
                ('hide_right_column_frontpage','0','0','Hide right column in frontpage','0'),
                ('front_tabs', 'dashboard,online_users,online_map', '0', 'Home page tabs order', '0'),
                ('speech_data',	'a:3:{i:0;b:0;s:8:"language";i:7;s:7:"dialect";s:5:"en-US";}',	1,	'',	1),
                ('sharing_nodejs_sllocation','https://cdn.socket.io/socket.io-1.1.0.js',0,'Location of SocketIO JS library',0),
                ('track_is_online','0',0,'Track is user still on site, chat status checks also has to be enabled',0),
				('show_languages','eng,lit,hrv,esp,por,nld,ara,ger,pol,rus,ita,fre,chn,cse,nor,tur,vnm,idn,sve,per,ell,dnk,rou,bgr,tha,geo,fin,alb',0,'Between what languages user should be able to switch',0),
                ('geoadjustment_data',	'a:8:{i:0;b:0;s:18:"use_geo_adjustment";b:0;s:13:"available_for";s:0:"";s:15:"other_countries";s:6:"custom";s:8:"hide_for";s:0:"";s:12:"other_status";s:7:"offline";s:11:"rest_status";s:6:"hidden";s:12:"apply_widget";i:0;}',	0,	'Geo adjustment settings',	1);


INSERT INTO "lh_users_setting" VALUES (1,1,'user_language','en_EN'),(2,1,'enable_pending_list','1'),(3,1,'enable_active_list','1'),(4,1,'enable_close_list','0'),(5,1,'enable_unread_list','1'),(6,1,'new_chat_sound','1'),(7,1,'chat_message','1');
COMMIT;