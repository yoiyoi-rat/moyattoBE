CREATE DATABASE IF NOT EXISTS moyatto_db;

USE moyatto_db;

CREATE TABLE IF NOT EXISTS posts (
    id INT AUTO_INCREMENT UNIQUE NOT NULL,
    user_name VARCHAR(255) NOT NULL,
    post_body TEXT NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
);
CREATE TABLE IF NOT EXISTS tags (
    id INT AUTO_INCREMENT UNIQUE NOT NULL,
    tag_body VARCHAR(255) UNIQUE NOT NULL,
    PRIMARY KEY (id)
);
CREATE TABLE IF NOT EXISTS organizations (
    id INT AUTO_INCREMENT UNIQUE NOT NULL,
    organization_name VARCHAR(255) NOT NULL,
    organization_body TEXT NOT NULL,
    link VARCHAR(255) NOT NULL DEFAULT "",
    PRIMARY KEY (id)
);
CREATE TABLE IF NOT EXISTS mid_post_tags (
    post_id INT NOT NULL,
    tag_id INT NOT NULL,
    FOREIGN KEY (post_id)
        REFERENCES posts(id)
        ON DELETE CASCADE,
    FOREIGN KEY (tag_id)
        REFERENCES tags(id)
        ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS mid_org_tags (
    organization_id INT NOT NULL,
    tag_id INT NOT NULL,
    FOREIGN KEY (organization_id)
        REFERENCES organizations(id)
        ON DELETE CASCADE,
    FOREIGN KEY (tag_id)
        REFERENCES tags(id)
        ON DELETE CASCADE
);

INSERT INTO posts (user_name, post_body)
VALUES
("はなこ", "暴言、暴力"),
("かなこ", "暴言、セクシャリティ"),
("たろう", "いじめ、人間関係"),
("けん", "家族、勉強、お金、健康"),
("さくら", "家族、勉強、お金、人間関係"),
("はなこ", "暴言、セクシャリティ"),
("かなこ", "セクシャリティ、しんどい、仕事"),
("たろう", "暴言、仕事、疲れた"),
("けん", "セクシャリティ、疲れた、しんどい、人間関係"),
("さくら", "家族、健康"),
("はなこ", "暴力、家族、人間関係"),
("かなこ", "暴言、暴力、いじめ、しんどい"),
("たろう", "お金、健康、仕事"),
("けん", "お金、仕事、疲れた"),
("さくら", "いじめ、人間関係、疲れた");

INSERT INTO tags (tag_body)
VALUES
("暴言"),
("暴力"),
("セクシュアリティ"),
("いじめ"),
("家族"),
("勉強"),
("お金"),
("健康"),
("仕事"),
("学校"),
("人間関係"),
("しんどい"),
("疲れた"),
("非行、犯罪"),
("ひきこもり");

INSERT INTO mid_post_tags (post_id, tag_id) 
VALUES
(1, 1),
(1, 2),
(2, 2),
(2, 3),
(3, 4),
(3, 11),
(4, 5),
(4, 6),
(4, 7),
(4, 8),
(5, 5),
(5, 6),
(5, 7),
(5, 11),
(6, 1),
(6, 3),
(7, 3),
(7, 9),
(7, 12),
(8, 1),
(8, 9),
(8, 13),
(9, 3),
(9, 11),
(9, 12),
(9, 13),
(10, 5),
(10, 8),
(11, 2),
(11, 5),
(11, 11),
(12, 1),
(12, 2),
(12, 4),
(12, 12),
(13, 7),
(13, 8),
(13, 9),
(14, 7),
(14, 9),
(14, 13),
(15, 4),
(15, 11),
(15, 13);


INSERT INTO organizations (organization_name, organization_body, link) 
VALUES
("DV相談プラス",
"パートナーや恋人から受けている様々な暴力（DV）について、専門の相談員が一緒に考えます。相談方法は電話・メール(24時間受付)、チャット(12:00～22:00)が選べます。",
"https://soudanplus.jp/"),
("24時間子供SOSダイヤル",
"いじめで困ったり、自分や友人の安全に不安があったりしたら、ひとりで悩まず、いつでもすぐ電話で相談してください。(24時間対応)",
"https://www.mext.go.jp/ijime/detail/dial.html"),
("子どもの人権SOSeメール",
"以下のような相談に応じます。
「いじめを受けて学校に行きたくない」
「先生から体罰を受けている」
「親から虐待されている」
など。",
"https://www.jinken.go.jp/soudan/PC_CH/0101.html"),
("相談ほっとLINE＠東京",
"生きるのがつらいと感じた時の悩み相談
対象:都内在住、在勤、在学のいずれかで、消えてしまいたいほどつらい気持ちや悩みを抱えている方",
"https://www.hokeniryo.metro.tokyo.lg.jp/kenkou/tokyokaigi/rinji1/linesoudan.html#cms47DE9"),
("LGBT相談@東京",
"LIME公式アカウントでの相談
性自認及び性的指向に関する様々な悩みや不安について、LINEによる相談を受け付けています。
ご本人だけでなく、ご家族等からのご相談もお受けします。
経験豊富な専門相談員がお話を伺います。
受付時間　 月曜日・水曜日・木曜日　17時～22時（祝日・年末年始除く。）
※受付は21時30分まで",
"https://www.soumu.metro.tokyo.lg.jp/10jinken/page/lgbt_soudan2.html"),
("東京しごとセンターヤングコーナー キャリアカウンセリング",
"ヤングコーナーのカウンセリングは、自己分析を行い、適職を知ることから始まって、ビジネスマナーやコミュニケーション能力、求人への応募方法や面接についてのアドバイスなど、皆様の就職活動を全面的にサポートしています。",
"https://tokyoshigoto-young.jp/service"),
("広島法務少年支援センター",
"非行、犯罪行為などでのトラブルやお悩みなどの相談を受け付けています。
対象：広島県にお住まいの方
利用可能時間：月～金曜日 午前9時～午後0時／午後1時～5時",
"https://www.moj.go.jp/kyousei1/kyousei03_00039.html"),
("児童相談所全国共通ダイヤル(189)",
"もし虐待をされている、または誰かがされていると思ったら、相談してください。
通告、相談は、匿名で行うこともでき、通告、相談をした人、その内容に関する秘密は守られます。
対象：だれでも(全国)
利用可能時間：毎日 24時間",
"https://kodomoshien.cfa.go.jp/no-gyakutai/"),
("いのちSOS（特定非営利活動法人 自殺対策支援センターライフリンク）",
"「死にたい」「消えたい」「生きることに疲れた」など、あなたのそんな気持ちを専門の相談員が受け止め、あなたの状況を一緒に整理し、必要な支援策などについて一緒に考えます。",
"https://www.lifelink.or.jp/inochisos/"),
("消費者ホットライン（188）",
"消費者ホットラインは、全国共通の電話番号で、地方公共団体が設置している身近な消費生活相談窓口を御案内いたします。",
"https://www.caa.go.jp/policies/policy/local_cooperation/local_consumer_administration/hotline/"),
("ひきこもり地域支援センター",
"すべての都道府県・指定都市にある、行政が運営するひきこもりに特化した相談窓口です。（NPO法人などに委託しているケースもあります。）社会福祉士や精神保健福祉士などの資格を持つ支援コーディネーターが中心となって相談支援などを行います。",
"https://hikikomori-voice-station.mhlw.go.jp/support/"),
("厚生労働省委託事業 ハラスメント悩み相談室",
"以下の内容に関する悩みをメール・SNS よりご相談いただける窓口です。
・カスタマーハラスメント（顧客等からの著しい迷惑行為）の被害相談
・就活ハラスメント（就職活動中やインターンシップ中に受けたセクハラやパワハラ）の被害相談",
"https://harasu-soudan.mhlw.go.jp/");




INSERT INTO mid_org_tags (organization_id, tag_id)
VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 7),
(1, 11),
(2, 1),
(2, 2),
(2, 3),
(2, 4),
(2, 5),
(2, 6),
(2, 7),
(2, 8),
(2, 10),
(2, 11),
(2, 12),
(2, 13),
(3, 1),
(3, 2),
(3, 4),
(3, 5),
(3, 10),
(3, 11),
(4, 12),
(4, 13),
(5, 3),
(6, 9),
(7, 1),
(7, 2),
(7, 4),
(7, 7),
(7, 14),
(8, 1),
(8, 2),
(8, 5),
(8, 7),
(8, 8),
(8, 12),
(8, 13),
(9, 8),
(9, 12),
(9, 13),
(10, 7),
(11, 5),
(11, 15),
(12, 1),
(12, 4),
(12, 9),
(12, 11),
(12, 13);

