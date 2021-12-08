-- CreateTable
CREATE TABLE "Personagem" (
    "id" SERIAL NOT NULL,
    "nome" TEXT NOT NULL,
    "imagemUrl" TEXT NOT NULL,
    "origemId" INTEGER NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Episodio" (
    "id" SERIAL NOT NULL,
    "nome" TEXT NOT NULL,
    "dataEstreia" DATE NOT NULL,
    "episodio" TEXT NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Localizacao" (
    "id" SERIAL NOT NULL,
    "nome" TEXT NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Usuario" (
    "id" SERIAL NOT NULL,
    "email" TEXT NOT NULL,
    "senha" TEXT NOT NULL,
    "nome" TEXT NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_EpisodioToPersonagem" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "Episodio.episodio_unique" ON "Episodio"("episodio");

-- CreateIndex
CREATE UNIQUE INDEX "Usuario.email_unique" ON "Usuario"("email");

-- CreateIndex
CREATE UNIQUE INDEX "_EpisodioToPersonagem_AB_unique" ON "_EpisodioToPersonagem"("A", "B");

-- CreateIndex
CREATE INDEX "_EpisodioToPersonagem_B_index" ON "_EpisodioToPersonagem"("B");

-- AddForeignKey
ALTER TABLE "Personagem" ADD FOREIGN KEY ("origemId") REFERENCES "Localizacao"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_EpisodioToPersonagem" ADD FOREIGN KEY ("A") REFERENCES "Episodio"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_EpisodioToPersonagem" ADD FOREIGN KEY ("B") REFERENCES "Personagem"("id") ON DELETE CASCADE ON UPDATE CASCADE;
