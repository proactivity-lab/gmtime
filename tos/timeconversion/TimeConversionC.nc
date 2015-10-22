/**
 * Make pivotal_gmtime functions available as TinyOS C scope mktime and gmtime_r.
 * Note that both use time64_t instead of time_t.
 *
 * @author Raido Pahtma
 * @license MIT
 */
module TimeConversionC { }
implementation {

	#include "time64.h" // This should define struct tm and time64_t/time_t

	#include "pivotal_gmtime_r.c" // Include all the code into this module

	// time64_t mktime64 (struct tm * t)
	time64_t mktime(struct tm* t) @C() {
		return mktime64(t);
	}

	// struct tm *gmtime64_r (const time64_t * _t, struct tm *p)
	struct tm* gmtime_r(const time64_t* timep, struct tm* result) @C() {
		return gmtime64_r(timep, result);
	}

}
