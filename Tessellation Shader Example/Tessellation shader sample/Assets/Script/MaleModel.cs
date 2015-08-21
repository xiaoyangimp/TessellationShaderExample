using UnityEngine;
using System.Collections;

public class MaleModel : MonoBehaviour {

	public Material defaultMaterial;
	public Material tessellationMaterial;

	public void changeMaterial( bool def ) {

		if(def) 
			gameObject.GetComponent<Renderer>().material = defaultMaterial;
		else
			gameObject.GetComponent<Renderer>().material = tessellationMaterial;

	}
}
