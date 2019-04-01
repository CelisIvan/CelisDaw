
<body>

        <div class="container">
            <h1>Lista de Incidentes Recientes</h1>
            <form id="ambos" name="ambos" action="guardar.php" method="POST">
                <div id="listain" name="listain">

                </div>    
            
            <div>
                
            <h1>Registra un nuevo incidente</h1>
                <label>¿Dónde fue el incidente?</label>
                    <select id="selectlugar" name="selectlugar">
                        
                    </select>
                </div>
                <div>
                <br>
                <label>¿Qué tipo de incidente fue?</label>
                    <select id="selectincidente" name="selectincidente">
                        
                    </select>
                </div>
                <br>
                <input type="submit" id="guardar" name="guardar" value="Guardar Incidente">
            </form>
        </div>
        <script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/main.js"></script>
</body>
