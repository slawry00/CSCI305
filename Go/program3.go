/* Program 3: Go
 * Spencer Lawry
 * CSCI 305
 * 2/28/2019
*/

package main


import(
   "os"
   "io/ioutil"
   "strings"
   "errors"
)

func check(e error){
   if e != nil{
      panic(e)
   }
}
func strip_chars(input_str, rem_chrs string) string{
    return strings.Map(func(r rune) rune {
        if strings.IndexRune(rem_chrs, r) < 0 {
            return r
        }
        return -1
    }, input_str)

}
func remove_numbers(input string) string{
   return strip_chars(input, "0123456789")
}

func main(){
   if len(os.Args) < 3 {
      e := errors.New("Not enough command line arguments"+ "\n" +
      "Format should be: go run program3.go (input-file) (output-file)")
      check(e)
      }

   input_file := os.Args[1]
   output_file := os.Args[2]

   data, err := ioutil.ReadFile(input_file)
   check(err)

   str_data := string(data) // changes it from []byte to string
   no_nums := remove_numbers(str_data)

   output_str := []byte(no_nums) //back to []byte
   err = ioutil.WriteFile(output_file, output_str, 0644)
   check(err)
}

