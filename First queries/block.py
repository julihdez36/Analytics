import hashlib
import time

# clase Block con nonce y mine_block()
# Agregar el atributo nonce al bloque.
# Añadir un método mine_block(difficulty) que busque un hash que empiece con cierto número de ceros ("0" * difficulty).

class Block:
    def __init__(self, index, timestamp, data, previous_hash=''):
        self.index = index
        self.timestamp = timestamp
        self.data = data
        self.previous_hash = previous_hash
        self.nonce = 0  # 🔹 Número que se irá ajustando para minar el bloque
        self.hash = self.calculate_hash()

    def calculate_hash(self):
        # Calcula el hash usando los atributos clave + nonce
        block_string = str(self.index) + str(self.timestamp) + str(self.data) + self.previous_hash + str(self.nonce)
        return hashlib.sha256(block_string.encode()).hexdigest()

    def mine_block(self, difficulty):
        # 🔐 Prueba de trabajo: buscar un hash que empiece con '0' * difficulty
        target = "0" * difficulty
        while self.hash[:difficulty] != target:
            self.nonce += 1
            self.hash = self.calculate_hash()
        print(f"Bloque minado: {self.hash}")

# Paso 2: clase Blockchain para aplicar minería
# Ahora hacemos que cada nuevo bloque sea minado antes de añadirse a la cadena. También añadimos un atributo de dificultad a la blockchain:

class Blockchain:
    def __init__(self):
        self.difficulty = 2  # Cuántos ceros debe tener el hash al inicio
        self.chain = [self.create_genesis_block()]
        

    def create_genesis_block(self):
        genesis_block = Block(0, time.time(), "Genesis Block", "0")
        genesis_block.mine_block(self.difficulty)
        return genesis_block

    def get_latest_block(self):
        return self.chain[-1]

    def add_block(self, data):
        last_block = self.get_latest_block()
        new_block = Block(
            index=last_block.index + 1,
            timestamp=time.time(),
            data=data,
            previous_hash=last_block.hash
        )
        print(f"Minando bloque #{new_block.index}...")
        new_block.mine_block(self.difficulty)
        self.chain.append(new_block)

    def is_chain_valid(self):
        for i in range(1, len(self.chain)):
            current = self.chain[i]
            previous = self.chain[i - 1]

            if current.hash != current.calculate_hash():
                print("Hash alterado")
                return False

            if current.previous_hash != previous.hash:
                print("Enlace roto")
                return False

        return True

# Prueba rápida con minería
my_blockchain = Blockchain()
my_blockchain.add_block("Bloque 1: Hola mundo")
my_blockchain.add_block("Bloque 2: Transacción A -> B")

print("\n¿Cadena válida?", my_blockchain.is_chain_valid())

# Mostrar bloques
for block in my_blockchain.chain:
    print(vars(block))
