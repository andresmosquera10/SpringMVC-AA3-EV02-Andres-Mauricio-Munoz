
package Controller;

import Entidad.Persona;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class Controlador {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @RequestMapping("index.htm")
    public ModelAndView Listar() {
        ModelAndView mav = new ModelAndView();
        String sql = "SELECT * FROM usuarios";
        List<Map<String, Object>> datos = jdbcTemplate.queryForList(sql);
        mav.addObject("lista", datos);
        mav.setViewName("index");
        return mav;
    }
@RequestMapping(value = "insertar.htm", method = RequestMethod.GET)
public ModelAndView Insertar() {
    ModelAndView mav = new ModelAndView();
    mav.addObject(new Persona());
    mav.setViewName("insertar");
    return mav;
}

@RequestMapping(value = "insertar.htm", method = RequestMethod.POST)
public ModelAndView Insertar(Persona p) {
    String sql="insert into usuarios(Nombre, Email, Password)values(?, ?, ?)";
    this.jdbcTemplate.update(sql,p.getNombre(),p.getCorreo(),p.getPassword());
    return new ModelAndView("redirect:/index.htm");
}
@RequestMapping(value = "editar.htm", method = RequestMethod.GET)
    public ModelAndView Editar(HttpServletRequest request) {
        int id = Integer.parseInt(request.getParameter("id"));
        String sql = "SELECT * FROM usuarios WHERE id = ?";
        Map<String, Object> row = jdbcTemplate.queryForMap(sql, id);

        Persona persona = new Persona();
        persona.setId(((Number) row.get("id")).intValue());
        persona.setNombre((String) row.get("Nombre"));
        persona.setCorreo((String) row.get("Email"));
        persona.setPassword((String) row.get("Password"));

        ModelAndView mav = new ModelAndView("editar");
        mav.addObject("persona", persona);
        return mav;
    }

    @RequestMapping(value = "editar.htm", method = RequestMethod.POST)
    public ModelAndView Editar(Persona p) {
        String sql = "UPDATE usuarios SET Nombre = ?, Email = ?, Password = ? WHERE id = ?";
        jdbcTemplate.update(sql, p.getNombre(), p.getCorreo(), p.getPassword(), p.getId());
        return new ModelAndView("redirect:/index.htm");
    }
    @RequestMapping("eliminar.htm")
    public ModelAndView Eliminar(HttpServletRequest request){
        int id = Integer.parseInt(request.getParameter("id"));
        String sql="DELETE FROM usuarios where id = ?";
        jdbcTemplate.update(sql, id);
        return new ModelAndView("redirect:/index.htm");
    }
}
    
