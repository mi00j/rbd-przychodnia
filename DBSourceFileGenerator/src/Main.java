import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;

public class Main {
	
	/**
	 * PARAMETR STARTOWY:
	 * recordNumber - liczba wierszy do wygenerowania
	 */
	
	public static final int recordNumber = 2000;

	public static void main(String[] args) {
		
		System.out.println("Start generating json");
		
		int limit = recordNumber -1;
		StringBuilder sb = new StringBuilder();
		sb.append("[\n");
		int i=0;
		while(true) {
			sb.append(Wizyta.toJsonString());
			if (i == limit) {
				break;
			}
			sb.append(",\n");
			i++;
		}
		sb.append("\n]");
		File file = new File("C:/json/WIZYTA.json");
		BufferedWriter writer = null;
		try {
		    writer = new BufferedWriter(new FileWriter(file));
		    writer.write(sb.toString());
		} catch (IOException e) {
			System.err.println("Error on writing StringBuffer to file");
		} finally {
		    if (writer != null)
				try {
					writer.close();
				} catch (IOException e) {
					System.err.println("Error on closing writer");
				}
		}
		
		System.out.println("Json generated succesfully");
	}

}
