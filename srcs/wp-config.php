<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'mbeaujar' );

/** MySQL database username */
define( 'DB_USER', 'www-data' );

/** MySQL database password */
define( 'DB_PASSWORD', 'mbeaujar' );

/** MySQL hostname */
define( 'DB_HOST', 'localhost' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         'SN47qT;WIeUI3{8-0>b/AJJU2`{yv#+.kexa@g}oEbb&JE<jqp)y&U>4NJqGJlOR' );
define( 'SECURE_AUTH_KEY',  '=71#>,lr6ZDCIP$@BJLwq&jMA?r#59rNIccZO-|zagU^)%)a)+v*=1hscQo|1Oj2' );
define( 'LOGGED_IN_KEY',    '$h#YW<^>R^|t?=M6_`e_]FMWt/k*N{KS`NH$3P5Tz7,|U.J[`+KgXSc)S,C+A16,' );
define( 'NONCE_KEY',        'cl)9a@u 891PYYNA{lRAm;k7>Wh(REx7h(20aBJiW~YBQ_N.nGHdgc6x|]ABUV&`' );
define( 'AUTH_SALT',        '4d5fbKy?2xud@QVmmaOA.(]dvy`C>-Ket1|-}U!np{9lH)(c}zU~H3 O{@7=3wqH' );
define( 'SECURE_AUTH_SALT', 'r&=,dc21~FO$#PQ(;{YF;12I)r-}Bq(bzB?$2=!]U5W9UuL*l_{:#Kro9(2<&?w+' );
define( 'LOGGED_IN_SALT',   '2_O[~G{CG9}S=8:^!zM@QlnS#ZLLg^M#tGr=e+|[Usw^cRwv*;~|X#Vct+@d*6;1' );
define( 'NONCE_SALT',       '*]2dUC_oZ1&tAo7G2^Un*4K[?b8K%{OeUOCs&w)3) z=g6!hh>tJ43)CQ(qeJ~p.' );

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
