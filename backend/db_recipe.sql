-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 23 Okt 2019 pada 03.56
-- Versi server: 10.1.37-MariaDB
-- Versi PHP: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_recipe`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_app`
--

CREATE TABLE `tb_app` (
  `id_app` int(11) NOT NULL,
  `app` varchar(50) NOT NULL,
  `pub_id` text NOT NULL,
  `banner_id` text NOT NULL,
  `int_id` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_app`
--

INSERT INTO `tb_app` (`id_app`, `app`, `pub_id`, `banner_id`, `int_id`) VALUES
(1, 'Chicken Recipes', '', '', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_ingredients`
--

CREATE TABLE `tb_ingredients` (
  `id_ingredients` int(11) NOT NULL,
  `id_recipe` int(11) NOT NULL,
  `ingredients` varchar(50) NOT NULL,
  `qty` int(11) NOT NULL,
  `unit` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_ingredients`
--

INSERT INTO `tb_ingredients` (`id_ingredients`, `id_recipe`, `ingredients`, `qty`, `unit`) VALUES
(1, 1, 'Garlic', 1, 'pieces'),
(2, 1, 'Sugar', 3, 'gr'),
(3, 1, 'salt', 2, 'gr'),
(4, 1, 'Onion', 3, 'pieces');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_recipe`
--

CREATE TABLE `tb_recipe` (
  `id_recipe` int(11) NOT NULL,
  `id_app` int(11) NOT NULL,
  `title` text NOT NULL,
  `time` int(11) NOT NULL,
  `img` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_recipe`
--

INSERT INTO `tb_recipe` (`id_recipe`, `id_app`, `title`, `time`, `img`) VALUES
(1, 1, 'Chicken Katsu', 20, 'https://cdn.cpnscdn.com/static.coupons.com/ext/kitchme/images/recipes/600x400/chicken-katsu_18841.jpg'),
(2, 1, 'Chicken Teriyaki', 30, 'https://www.jessicagavin.com/wp-content/uploads/2018/08/instant-pot-teriyaki-chicken-5-1200.jpg'),
(3, 1, 'Chicken Wings', 45, 'https://tmbidigitalassetsazure.blob.core.windows.net/secure/RMS/attachments/37/1200x1200/Best-Ever-Fried-Chicken-Wings_EXPS_THFM18_208490_D09_19_4b.jpg'),
(4, 1, 'Chicken Cordons Bleu', 55, 'https://www.the-girl-who-ate-everything.com/wp-content/uploads/blogger/-9QZZySW_P24/TnlVKU07FiI/AAAAAAAAHNA/ZrwWVpMwSTM/s1600/chicken-cordon-bleu.JPG'),
(5, 1, 'Fried Chicken', 25, 'https://images.japancentre.com/recipes/pics/37/main/karaage.jpg?1545904801'),
(6, 1, 'BBQ Chicken', 30, 'https://assets.myfoodandfamily.com/adaptivemedia/rendition/210058_3000x2000.jpg?id=705dc529bca18c713c148b9f2d97724d12162d3e&ht=650&wd=1004&clid=pim'),
(7, 1, 'Chicken Strips', 45, 'https://img.buzzfeed.com/buzzfeed-static/static/2017-06/13/14/asset/buzzfeed-prod-fastlane-01/sub-buzz-1806-1497377220-7.jpg?downsize=700%3A%2A&output-quality=auto&output-format=auto&output-quality=auto&output-format=auto&downsize=360:*'),
(8, 1, 'Chicken Kung Pao', 60, 'https://img.taste.com.au/-7KlOnpq/taste/2018/02/kung-pao-chicken-taste-135078-1.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_steps`
--

CREATE TABLE `tb_steps` (
  `id_steps` int(11) NOT NULL,
  `id_recipe` int(11) NOT NULL,
  `steps` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_steps`
--

INSERT INTO `tb_steps` (`id_steps`, `id_recipe`, `steps`) VALUES
(1, 1, 'Select Pieces of Chicken'),
(3, 1, 'Boil Chicken With the Water on 70\'C'),
(4, 1, 'Fried the Chicken with Olive oil on 80\'C And Put on the plate when Chicken already Cooked');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_user`
--

CREATE TABLE `tb_user` (
  `id_user` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` text NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tb_app`
--
ALTER TABLE `tb_app`
  ADD PRIMARY KEY (`id_app`);

--
-- Indeks untuk tabel `tb_ingredients`
--
ALTER TABLE `tb_ingredients`
  ADD PRIMARY KEY (`id_ingredients`),
  ADD KEY `id_recipe` (`id_recipe`);

--
-- Indeks untuk tabel `tb_recipe`
--
ALTER TABLE `tb_recipe`
  ADD PRIMARY KEY (`id_recipe`),
  ADD KEY `id_app` (`id_app`);

--
-- Indeks untuk tabel `tb_steps`
--
ALTER TABLE `tb_steps`
  ADD PRIMARY KEY (`id_steps`),
  ADD KEY `id_recipe` (`id_recipe`);

--
-- Indeks untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tb_app`
--
ALTER TABLE `tb_app`
  MODIFY `id_app` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `tb_ingredients`
--
ALTER TABLE `tb_ingredients`
  MODIFY `id_ingredients` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `tb_recipe`
--
ALTER TABLE `tb_recipe`
  MODIFY `id_recipe` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `tb_steps`
--
ALTER TABLE `tb_steps`
  MODIFY `id_steps` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tb_ingredients`
--
ALTER TABLE `tb_ingredients`
  ADD CONSTRAINT `tb_ingredients_ibfk_1` FOREIGN KEY (`id_recipe`) REFERENCES `tb_recipe` (`id_recipe`);

--
-- Ketidakleluasaan untuk tabel `tb_recipe`
--
ALTER TABLE `tb_recipe`
  ADD CONSTRAINT `tb_recipe_ibfk_1` FOREIGN KEY (`id_app`) REFERENCES `tb_app` (`id_app`);

--
-- Ketidakleluasaan untuk tabel `tb_steps`
--
ALTER TABLE `tb_steps`
  ADD CONSTRAINT `tb_steps_ibfk_1` FOREIGN KEY (`id_recipe`) REFERENCES `tb_recipe` (`id_recipe`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
