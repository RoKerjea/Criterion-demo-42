/*ideas of subjects to tests:
if a bool value is correct, (does this value validate x criteria)
object creation
object method call
call to get value
call to modify value
check that a struct contain expected value in field x,y,z

verify that an error is properly thrown

unsure:
can we check if an object is an instance of a specific type(is an animal object, a cat object, etc)?

note: hard to test cout output
but we just need to separate string generation and print operation
->not useful to write tests to verify that cpp behave like cpp
we need to test OUR code, not everything, always, in any possible circonstances 
most of whats demonstrated her can be achieved with the "assert" function (man assert). but it's less practical to separate the tests from the "production" code

talk about possible uses:
precise observable objectives (admission test)
making sure a future modification doesn't break a currently correct code (regression test)
coupling with a timer function for benchmarking
separating internal logic from exterior library/framework to diminish time/cost (using mock inputs to verify that the code act as intended )

possible idea for a demo4:
git action integration for Continuous Integration
-> a script that launch a docker on a git server
docker compile and execute tests, accept or refuse push depending on the results
*/