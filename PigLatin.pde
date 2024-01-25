public void setup() {
        String[] lines = loadStrings("words.txt");
        System.out.println("there are " + lines.length + " lines");
        for (int i = 0; i < lines.length; i++) {
            System.out.println(pigLatin(lines[i]));
        }
    }

    public void draw() {
        // Not used
    }

    public int findFirstVowel(String sWord) {
        for (int i = 0; i < sWord.length(); i++) {
            if (sWord.charAt(i) == 'a' || sWord.charAt(i) == 'e' || sWord.charAt(i) == 'i' || sWord.charAt(i) == 'o' || sWord.charAt(i) == 'u') {
                return i;
            }
        }
        return -1;
    }

    public String pigLatin(String sWord) {
        if (findFirstVowel(sWord) == -1) {
            return sWord + "ay";
        } else if (findFirstVowel(sWord) == 0) {
            return sWord + "way";
        } else if (sWord.startsWith("qu")) {
            return sWord.substring(2) + "quay";
        } else if (findFirstVowel(sWord) != -1) {
            return sWord.substring(findFirstVowel(sWord)) + sWord.substring(0, findFirstVowel(sWord)) + "ay";
        } else {
            return "ERROR!";
        }
    }

    private String[] loadStrings(String filename) {
        String[] lines = new String[8];
        try {
            File myFile = new File(filename);
            Scanner myReader = new Scanner(myFile);
            int counter = 0;
            while (myReader.hasNextLine()) {
                String data = myReader.nextLine();
                lines[counter] = data;
                counter++;
            }
            myReader.close();
        } catch (FileNotFoundException e) {
            System.out.println("An error occurred.");
            e.printStackTrace();
        }
        return lines;
    }

