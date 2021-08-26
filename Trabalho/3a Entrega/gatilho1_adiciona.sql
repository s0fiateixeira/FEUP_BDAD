.mode columns
.headers on
.nullvalue NULL

PRAGMA foreign_keys = ON;

--O bilhete apenas poderá ser adquirido no caso do
--espectador cumprir com o limite de idade imposto
--pelo evento associado

CREATE TRIGGER IF NOT EXISTS limite_idade_bilhete
BEFORE INSERT ON Bilhete
WHEN
(
    SELECT Pessoa.id
    FROM EventoCultural, Bilhete, Pessoa
    WHERE Pessoa.id = NEW.espectadorId AND Bilhete.evento = EventoCultural.id AND limiteIdade = 1 AND idade < 18
)
BEGIN
    SELECT RAISE(ABORT, 'O utilizador não tem idade adequada para adquirir o bilhete');
END;
