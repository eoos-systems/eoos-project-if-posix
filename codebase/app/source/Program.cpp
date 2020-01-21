/**
 * Entry point to an operating system main program.
 *
 * @author    Sergey Baigudin, sergey@baigudin.software
 * @copyright 2019, Sergey Baigudin, Baigudin Software
 * @license   http://embedded.team/license/
 */
#include "Program.hpp"
#include "library.String.hpp"
#include "System.hpp"

namespace local
{
    /**
     * Starts executing an operating system main program.
     *
     * @return zero, or error code if an error has been occurred.
     */
    int32 Program::start()
    {
        api::System& system = System::call();
        int64 time = system.getTime();
        if(time > 0)
        {

            library::String<char,0> str("Hello, world!");
	        volatile static bool isRun = true;
            while( isRun )
            {
                isRun = false;
            }
        }
        return 0;
    }
}
