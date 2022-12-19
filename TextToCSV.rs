use std::error::Error;
use std::fs::File;
use std::io::{BufReader, BufWriter, Write};
use csv::{Reader, Writer};

fn main() -> Result<(), Box<dyn Error>> {
    // Abrimos un fichero de texto
    let file = File::open("ejemplo.txt")?;
    let reader = BufReader::new(file);

    // Generamos un fichero CSV
    let file = File::create("texto.csv")?;
    let mut writer = Writer::from_writer(BufWriter::new(file));

    // Leemos cada línea del archivo de texto y la escribimos en el archivo CSV
    for result in reader.lines() {
        let line = result?;
        writer.write_record(&[line])?;
    }
    writer.flush()?;

    Ok(())
}
