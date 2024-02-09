using Microsoft.AspNetCore.Mvc;
using CRUDEmployee.Datos;
using CRUDEmployee.Models;

namespace CRUDEmployee.Controllers
{
    public class MantenedorController : Controller
    {
        employeeDatos _EmployeeDatos = new employeeDatos();

 
        public IActionResult Listar(string nombreFiltro)
        {
            var oLista = string.IsNullOrEmpty(nombreFiltro) ? _EmployeeDatos.Listar() : _EmployeeDatos.Filtrar(nombreFiltro);
            return View(oLista);
        }

        public IActionResult Guardar()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Guardar(EmployeeModel oEmployee)
        {
            var existingEmployee = _EmployeeDatos.ObtenerPorRFC(oEmployee.RFC);
            if (existingEmployee != null)
            {
                ModelState.AddModelError("RFC", "El RFC ingresado ya está en uso.");
                return View(oEmployee);
            }

            var respuesta = _EmployeeDatos.Guardar(oEmployee);
            if (respuesta)
            {
                return RedirectToAction("Listar");
            }
            else
            {
                return View();
            }
        }

        public IActionResult EditarPorRFC(string rfc)
        {
            var oEmployee = _EmployeeDatos.ObtenerPorRFC(rfc);
            return View(oEmployee);
        }

        [HttpPost]
        public IActionResult EditarPorRFC(EmployeeModel oEmployee)
        {
            var respuesta = _EmployeeDatos.Editar(oEmployee);
            if (respuesta)
            {
                return RedirectToAction("Listar");
            }
            else
            {
                ModelState.AddModelError(string.Empty, "La edición no fue exitosa. Por favor, revise los datos y vuelva a intentarlo.");
                return View(oEmployee);
            }
        }

        public IActionResult Eliminar(string rfc)
        {
            var oEmployee = _EmployeeDatos.ObtenerPorRFC(rfc);
            return View(oEmployee);
        }

        [HttpPost]
        public IActionResult Eliminar(EmployeeModel oEmployee)
        {
            var respuesta = _EmployeeDatos.Eliminar(oEmployee);
            if (respuesta)
            {
                return RedirectToAction("Listar");
            }
            else
            {
                ModelState.AddModelError(string.Empty, "Eliminated.");
                return View(oEmployee);
            }
        }
    }
}
