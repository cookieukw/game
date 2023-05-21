extends Area2D

# Variável para controlar a velocidade do personagem
@export var speed = 400

# Variáveis para o tamanho da tela e a velocidade atual do personagem
var screen_size
var velocity = Vector2.ZERO

# Método chamado quando o objeto é carregado
func _ready():
	screen_size = get_viewport_rect().size  
 # Obtém o tamanho da tela

# Método chamado a cada quadro (frame) para atualizar a lógica do jogo
func _process(delta):
	# Verifica se a velocidade atual é zero
	if velocity.x == 0:
		$AnimatedSprite2D.play("dead")
# Se sim, reproduz a animação "dead"
	else:
		$AnimatedSprite2D.play("walk")
# Se não, reproduz a animação "walk"
		position += velocity * delta
# Move o personagem de acordo com a velocidade e o tempo decorrido
		position.x = clamp(position.x, 0, screen_size.x)  # Limita a posição do personagem dentro dos limites da tela
		$AnimatedSprite2D.flip_h = velocity.x < 0  # Inverte a direção da animação dependendo da direção do movimento

# Método chamado quando o botão "left" é pressionado
func _on_left():
	velocity.x = -speed  # Define a velocidade horizontal para a esquerda

# Método chamado quando o botão "right" é pressionado
func _on_right():
	velocity.x = speed  # Define a velocidade horizontal para a direita

# Método chamado quando o botão "up" é solto
func _on_up():
	velocity.x = 0  # Define a velocidade horizontal como zero (parado)
	pass
